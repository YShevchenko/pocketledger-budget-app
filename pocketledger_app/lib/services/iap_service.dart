import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants.dart';

const String _kPremiumKey = 'is_premium';

class IapService {
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  bool _isPremium = false;
  ProductDetails? _premiumProduct;

  bool get isPremium => _isPremium;
  ProductDetails? get premiumProduct => _premiumProduct;

  final _premiumController = StreamController<bool>.broadcast();
  Stream<bool> get premiumStream => _premiumController.stream;

  Future<void> initialize() async {
    // Restore persisted premium state so users don't see paywall on cold start
    final prefs = await SharedPreferences.getInstance();
    _isPremium = prefs.getBool(_kPremiumKey) ?? false;
    if (_isPremium) {
      _premiumController.add(true);
    }

    final available = await _iap.isAvailable();
    if (!available) return;

    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onDone: () => _subscription?.cancel(),
      onError: (error) {
        // Handle error silently
      },
    );

    await _loadProducts();
  }

  Future<void> _loadProducts() async {
    final response = await _iap.queryProductDetails({kPremiumProductId});
    if (response.productDetails.isNotEmpty) {
      _premiumProduct = response.productDetails.first;
    }
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      if (purchase.productID == kPremiumProductId) {
        if (purchase.status == PurchaseStatus.purchased ||
            purchase.status == PurchaseStatus.restored) {
          _isPremium = true;
          _premiumController.add(true);
          _persistPremium(true);
        }
      }
      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
      }
    }
  }

  Future<void> _persistPremium(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kPremiumKey, value);
  }

  Future<bool> purchasePremium() async {
    if (_premiumProduct == null) return false;
    final purchaseParam = PurchaseParam(productDetails: _premiumProduct!);
    return _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  void dispose() {
    _subscription?.cancel();
    _premiumController.close();
  }

  /// For testing: force set premium state
  void setPremium(bool value) {
    _isPremium = value;
    _premiumController.add(value);
    _persistPremium(value);
  }
}
