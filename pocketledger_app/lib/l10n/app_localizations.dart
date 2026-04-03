import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('de'),
    Locale('es'),
    Locale('uk'),
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'PocketLedger',
      'ledger': 'Ledger',
      'envelopes': 'Envelopes',
      'analytics': 'Analytics',
      'settings': 'Settings',
      'currentLiquidity': 'Current Liquidity',
      'availableToBudget': 'Available to Budget',
      'savingsRate': 'Savings Rate',
      'dailyBurn': 'Daily Burn',
      'viewAll': 'View All',
      'remaining': 'Remaining',
      'overspent': 'Overspent',
      'spent': 'Spent',
      'limit': 'Limit',
      'newEntry': 'New Entry',
      'currentLedgerEntry': 'Current Ledger Entry',
      'logTransaction': 'Log Transaction',
      'today': 'Today',
      'yesterday': 'Yesterday',
      'income': 'Income',
      'availableBudget': 'Available Budget',
      'monthlyGoal': 'Monthly Goal',
      'activity': 'Activity',
      'filter': 'Filter',
      'moveMoney': 'Move Money',
      'premium': 'Premium',
      'premiumUnlock': 'Premium Unlock',
      'premiumDescription':
          'Unlock unlimited envelopes, recurring bills, receipt photos, charts, and export.',
      'upgradeNow': 'Upgrade Now',
      'oneTimePayment': 'one-time payment',
      'security': 'Security',
      'requireFaceId': 'Require FaceID',
      'secureAccess': 'Secure access at launch',
      'dataManagement': 'Data Management',
      'exportJson': 'Export Ledger to JSON',
      'importData': 'Import Data',
      'exportCsv': 'Export to CSV',
      'privacyPolicy': 'Privacy Policy',
      'termsOfService': 'Terms of Service',
      'version': 'Version',
      'build': 'Build',
      'createEnvelope': 'Create Envelope',
      'editEnvelope': 'Edit Envelope',
      'envelopeName': 'Envelope Name',
      'budgetAmount': 'Budget Amount',
      'color': 'Color',
      'icon': 'Icon',
      'save': 'Save',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'deleteEnvelope': 'Delete Envelope',
      'deleteEnvelopeConfirm':
          'Are you sure you want to delete this envelope? All transactions will also be deleted.',
      'transfer': 'Transfer',
      'from': 'From',
      'to': 'To',
      'amount': 'Amount',
      'note': 'Note',
      'confirm': 'Confirm',
      'recurringBills': 'Recurring Bills',
      'addBill': 'Add Bill',
      'editBill': 'Edit Bill',
      'billName': 'Bill Name',
      'dayOfMonth': 'Day of Month',
      'active': 'Active',
      'monthlyReset': 'Monthly Reset',
      'monthlyResetConfirm':
          'Reset all envelope spent amounts to zero? This cannot be undone.',
      'reset': 'Reset',
      'noEnvelopes': 'No envelopes yet',
      'createFirst': 'Create your first envelope to start budgeting',
      'noTransactions': 'No transactions yet',
      'addFirst': 'Add your first transaction',
      'description': 'Description',
      'date': 'Date',
      'attachReceipt': 'Attach Receipt',
      'viewReceipt': 'View Receipt',
      'freeLimitReached': 'Free Limit Reached',
      'freeLimitMessage':
          'Upgrade to Premium to create unlimited envelopes.',
      'exportSuccess': 'Export successful',
      'importSuccess': 'Import successful',
      'error': 'Error',
      'selectEnvelope': 'Select Envelope',
      'allEnvelopes': 'All Envelopes',
      'thisMonth': 'This Month',
      'lastMonth': 'Last Month',
      'custom': 'Custom',
      'general': 'General',
      'currency': 'Currency',
      'language': 'Language',
      'about': 'About',
      'restorePurchases': 'Restore Purchases',
    },
    'de': {
      'appName': 'PocketLedger',
      'ledger': 'Hauptbuch',
      'envelopes': 'Umschlaege',
      'analytics': 'Analytik',
      'settings': 'Einstellungen',
      'currentLiquidity': 'Aktuelle Liquiditaet',
      'availableToBudget': 'Verfuegbar zum Budgetieren',
      'savingsRate': 'Sparquote',
      'dailyBurn': 'Taegliche Ausgaben',
      'viewAll': 'Alle anzeigen',
      'remaining': 'Verbleibend',
      'overspent': 'Ueberschritten',
      'spent': 'Ausgegeben',
      'limit': 'Limit',
      'newEntry': 'Neuer Eintrag',
      'currentLedgerEntry': 'Aktueller Eintrag',
      'logTransaction': 'Transaktion erfassen',
      'today': 'Heute',
      'yesterday': 'Gestern',
      'income': 'Einkommen',
      'availableBudget': 'Verfuegbares Budget',
      'monthlyGoal': 'Monatsziel',
      'activity': 'Aktivitaet',
      'filter': 'Filter',
      'moveMoney': 'Geld verschieben',
      'premium': 'Premium',
      'premiumUnlock': 'Premium freischalten',
      'premiumDescription':
          'Schalte unbegrenzte Umschlaege, wiederkehrende Rechnungen, Belegfotos, Diagramme und Export frei.',
      'upgradeNow': 'Jetzt upgraden',
      'oneTimePayment': 'Einmalzahlung',
      'security': 'Sicherheit',
      'requireFaceId': 'FaceID erforderlich',
      'secureAccess': 'Sicherer Zugang beim Start',
      'dataManagement': 'Datenverwaltung',
      'exportJson': 'Hauptbuch als JSON exportieren',
      'importData': 'Daten importieren',
      'exportCsv': 'Als CSV exportieren',
      'privacyPolicy': 'Datenschutzrichtlinie',
      'termsOfService': 'Nutzungsbedingungen',
      'version': 'Version',
      'build': 'Build',
      'createEnvelope': 'Umschlag erstellen',
      'editEnvelope': 'Umschlag bearbeiten',
      'envelopeName': 'Umschlagname',
      'budgetAmount': 'Budgetbetrag',
      'color': 'Farbe',
      'icon': 'Symbol',
      'save': 'Speichern',
      'cancel': 'Abbrechen',
      'delete': 'Loeschen',
      'deleteEnvelope': 'Umschlag loeschen',
      'deleteEnvelopeConfirm':
          'Sind Sie sicher, dass Sie diesen Umschlag loeschen moechten? Alle Transaktionen werden ebenfalls geloescht.',
      'transfer': 'Ueberweisung',
      'from': 'Von',
      'to': 'Nach',
      'amount': 'Betrag',
      'note': 'Notiz',
      'confirm': 'Bestaetigen',
      'recurringBills': 'Wiederkehrende Rechnungen',
      'addBill': 'Rechnung hinzufuegen',
      'editBill': 'Rechnung bearbeiten',
      'billName': 'Rechnungsname',
      'dayOfMonth': 'Tag im Monat',
      'active': 'Aktiv',
      'monthlyReset': 'Monatlicher Reset',
      'monthlyResetConfirm':
          'Alle Umschlag-Ausgaben auf Null zuruecksetzen? Dies kann nicht rueckgaengig gemacht werden.',
      'reset': 'Zuruecksetzen',
      'noEnvelopes': 'Noch keine Umschlaege',
      'createFirst': 'Erstellen Sie Ihren ersten Umschlag',
      'noTransactions': 'Noch keine Transaktionen',
      'addFirst': 'Fuegen Sie Ihre erste Transaktion hinzu',
      'description': 'Beschreibung',
      'date': 'Datum',
      'attachReceipt': 'Beleg anfuegen',
      'viewReceipt': 'Beleg anzeigen',
      'freeLimitReached': 'Kostenloses Limit erreicht',
      'freeLimitMessage':
          'Upgraden Sie auf Premium fuer unbegrenzte Umschlaege.',
      'exportSuccess': 'Export erfolgreich',
      'importSuccess': 'Import erfolgreich',
      'error': 'Fehler',
      'selectEnvelope': 'Umschlag waehlen',
      'allEnvelopes': 'Alle Umschlaege',
      'thisMonth': 'Dieser Monat',
      'lastMonth': 'Letzter Monat',
      'custom': 'Benutzerdefiniert',
      'general': 'Allgemein',
      'currency': 'Waehrung',
      'language': 'Sprache',
      'about': 'Ueber',
      'restorePurchases': 'Kaeufe wiederherstellen',
    },
    'es': {
      'appName': 'PocketLedger',
      'ledger': 'Libro Mayor',
      'envelopes': 'Sobres',
      'analytics': 'Analiticas',
      'settings': 'Ajustes',
      'currentLiquidity': 'Liquidez Actual',
      'availableToBudget': 'Disponible para Presupuestar',
      'savingsRate': 'Tasa de Ahorro',
      'dailyBurn': 'Gasto Diario',
      'viewAll': 'Ver Todo',
      'remaining': 'Restante',
      'overspent': 'Excedido',
      'spent': 'Gastado',
      'limit': 'Limite',
      'newEntry': 'Nueva Entrada',
      'currentLedgerEntry': 'Entrada Actual',
      'logTransaction': 'Registrar Transaccion',
      'today': 'Hoy',
      'yesterday': 'Ayer',
      'income': 'Ingresos',
      'availableBudget': 'Presupuesto Disponible',
      'monthlyGoal': 'Meta Mensual',
      'activity': 'Actividad',
      'filter': 'Filtrar',
      'moveMoney': 'Mover Dinero',
      'premium': 'Premium',
      'premiumUnlock': 'Desbloquear Premium',
      'premiumDescription':
          'Desbloquea sobres ilimitados, facturas recurrentes, fotos de recibos, graficos y exportacion.',
      'upgradeNow': 'Actualizar Ahora',
      'oneTimePayment': 'pago unico',
      'security': 'Seguridad',
      'requireFaceId': 'Requerir FaceID',
      'secureAccess': 'Acceso seguro al iniciar',
      'dataManagement': 'Gestion de Datos',
      'exportJson': 'Exportar Libro a JSON',
      'importData': 'Importar Datos',
      'exportCsv': 'Exportar a CSV',
      'privacyPolicy': 'Politica de Privacidad',
      'termsOfService': 'Terminos de Servicio',
      'version': 'Version',
      'build': 'Compilacion',
      'createEnvelope': 'Crear Sobre',
      'editEnvelope': 'Editar Sobre',
      'envelopeName': 'Nombre del Sobre',
      'budgetAmount': 'Monto del Presupuesto',
      'color': 'Color',
      'icon': 'Icono',
      'save': 'Guardar',
      'cancel': 'Cancelar',
      'delete': 'Eliminar',
      'deleteEnvelope': 'Eliminar Sobre',
      'deleteEnvelopeConfirm':
          'Esta seguro de que desea eliminar este sobre? Todas las transacciones tambien se eliminaran.',
      'transfer': 'Transferencia',
      'from': 'De',
      'to': 'A',
      'amount': 'Monto',
      'note': 'Nota',
      'confirm': 'Confirmar',
      'recurringBills': 'Facturas Recurrentes',
      'addBill': 'Agregar Factura',
      'editBill': 'Editar Factura',
      'billName': 'Nombre de Factura',
      'dayOfMonth': 'Dia del Mes',
      'active': 'Activo',
      'monthlyReset': 'Reinicio Mensual',
      'monthlyResetConfirm':
          'Reiniciar todos los gastos de sobres a cero? Esto no se puede deshacer.',
      'reset': 'Reiniciar',
      'noEnvelopes': 'Sin sobres aun',
      'createFirst': 'Crea tu primer sobre para comenzar',
      'noTransactions': 'Sin transacciones aun',
      'addFirst': 'Agrega tu primera transaccion',
      'description': 'Descripcion',
      'date': 'Fecha',
      'attachReceipt': 'Adjuntar Recibo',
      'viewReceipt': 'Ver Recibo',
      'freeLimitReached': 'Limite Gratuito Alcanzado',
      'freeLimitMessage':
          'Actualiza a Premium para crear sobres ilimitados.',
      'exportSuccess': 'Exportacion exitosa',
      'importSuccess': 'Importacion exitosa',
      'error': 'Error',
      'selectEnvelope': 'Seleccionar Sobre',
      'allEnvelopes': 'Todos los Sobres',
      'thisMonth': 'Este Mes',
      'lastMonth': 'Mes Pasado',
      'custom': 'Personalizado',
      'general': 'General',
      'currency': 'Moneda',
      'language': 'Idioma',
      'about': 'Acerca de',
      'restorePurchases': 'Restaurar Compras',
    },
    'uk': {
      'appName': 'PocketLedger',
      'ledger': 'Журнал',
      'envelopes': 'Конверти',
      'analytics': 'Аналiтика',
      'settings': 'Налаштування',
      'currentLiquidity': 'Поточна лiквiднiсть',
      'availableToBudget': 'Доступно для бюджету',
      'savingsRate': 'Ставка заощаджень',
      'dailyBurn': 'Щоденнi витрати',
      'viewAll': 'Переглянути все',
      'remaining': 'Залишок',
      'overspent': 'Перевитрата',
      'spent': 'Витрачено',
      'limit': 'Лiмiт',
      'newEntry': 'Новий запис',
      'currentLedgerEntry': 'Поточний запис',
      'logTransaction': 'Записати транзакцiю',
      'today': 'Сьогоднi',
      'yesterday': 'Вчора',
      'income': 'Дохiд',
      'availableBudget': 'Доступний бюджет',
      'monthlyGoal': 'Мiсячна цiль',
      'activity': 'Активнiсть',
      'filter': 'Фiльтр',
      'moveMoney': 'Перемiстити кошти',
      'premium': 'Премiум',
      'premiumUnlock': 'Розблокувати Премiум',
      'premiumDescription':
          'Розблокуйте необмеженi конверти, повторюванi рахунки, фото чекiв, графiки та експорт.',
      'upgradeNow': 'Оновити зараз',
      'oneTimePayment': 'одноразовий платiж',
      'security': 'Безпека',
      'requireFaceId': 'Вимагати FaceID',
      'secureAccess': 'Безпечний доступ при запуску',
      'dataManagement': 'Керування даними',
      'exportJson': 'Експорт журналу в JSON',
      'importData': 'Iмпорт даних',
      'exportCsv': 'Експорт в CSV',
      'privacyPolicy': 'Полiтика конфiденцiйностi',
      'termsOfService': 'Умови обслуговування',
      'version': 'Версiя',
      'build': 'Збiрка',
      'createEnvelope': 'Створити конверт',
      'editEnvelope': 'Редагувати конверт',
      'envelopeName': 'Назва конверта',
      'budgetAmount': 'Сума бюджету',
      'color': 'Колiр',
      'icon': 'Iконка',
      'save': 'Зберегти',
      'cancel': 'Скасувати',
      'delete': 'Видалити',
      'deleteEnvelope': 'Видалити конверт',
      'deleteEnvelopeConfirm':
          'Ви впевненi, що хочете видалити цей конверт? Усi транзакцiї також будуть видаленi.',
      'transfer': 'Переказ',
      'from': 'Вiд',
      'to': 'До',
      'amount': 'Сума',
      'note': 'Примiтка',
      'confirm': 'Пiдтвердити',
      'recurringBills': 'Повторюванi рахунки',
      'addBill': 'Додати рахунок',
      'editBill': 'Редагувати рахунок',
      'billName': 'Назва рахунку',
      'dayOfMonth': 'День мiсяця',
      'active': 'Активний',
      'monthlyReset': 'Мiсячне скидання',
      'monthlyResetConfirm':
          'Скинути всi витрати конвертiв до нуля? Це неможливо скасувати.',
      'reset': 'Скинути',
      'noEnvelopes': 'Ще немає конвертiв',
      'createFirst': 'Створiть перший конверт',
      'noTransactions': 'Ще немає транзакцiй',
      'addFirst': 'Додайте першу транзакцiю',
      'description': 'Опис',
      'date': 'Дата',
      'attachReceipt': 'Додати чек',
      'viewReceipt': 'Переглянути чек',
      'freeLimitReached': 'Безкоштовний лiмiт вичерпано',
      'freeLimitMessage':
          'Оновiть до Премiум для необмежених конвертiв.',
      'exportSuccess': 'Експорт успiшний',
      'importSuccess': 'Iмпорт успiшний',
      'error': 'Помилка',
      'selectEnvelope': 'Обрати конверт',
      'allEnvelopes': 'Усi конверти',
      'thisMonth': 'Цей мiсяць',
      'lastMonth': 'Минулий мiсяць',
      'custom': 'Власний',
      'general': 'Загальне',
      'currency': 'Валюта',
      'language': 'Мова',
      'about': 'Про додаток',
      'restorePurchases': 'Вiдновити покупки',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['en']?[key] ??
        key;
  }

  // Convenience getters
  String get appName => get('appName');
  String get ledger => get('ledger');
  String get envelopes => get('envelopes');
  String get analytics => get('analytics');
  String get settings => get('settings');
  String get currentLiquidity => get('currentLiquidity');
  String get availableToBudget => get('availableToBudget');
  String get savingsRate => get('savingsRate');
  String get dailyBurn => get('dailyBurn');
  String get viewAll => get('viewAll');
  String get remaining => get('remaining');
  String get overspent => get('overspent');
  String get spent => get('spent');
  String get limit => get('limit');
  String get newEntry => get('newEntry');
  String get currentLedgerEntry => get('currentLedgerEntry');
  String get logTransaction => get('logTransaction');
  String get today => get('today');
  String get yesterday => get('yesterday');
  String get income => get('income');
  String get availableBudget => get('availableBudget');
  String get monthlyGoal => get('monthlyGoal');
  String get activity => get('activity');
  String get filter => get('filter');
  String get moveMoney => get('moveMoney');
  String get premium => get('premium');
  String get premiumUnlock => get('premiumUnlock');
  String get premiumDescription => get('premiumDescription');
  String get upgradeNow => get('upgradeNow');
  String get oneTimePayment => get('oneTimePayment');
  String get security => get('security');
  String get requireFaceId => get('requireFaceId');
  String get secureAccess => get('secureAccess');
  String get dataManagement => get('dataManagement');
  String get exportJson => get('exportJson');
  String get importData => get('importData');
  String get exportCsv => get('exportCsv');
  String get privacyPolicy => get('privacyPolicy');
  String get termsOfService => get('termsOfService');
  String get versionLabel => get('version');
  String get build => get('build');
  String get createEnvelope => get('createEnvelope');
  String get editEnvelope => get('editEnvelope');
  String get envelopeName => get('envelopeName');
  String get budgetAmount => get('budgetAmount');
  String get color => get('color');
  String get icon => get('icon');
  String get save => get('save');
  String get cancel => get('cancel');
  String get delete => get('delete');
  String get deleteEnvelope => get('deleteEnvelope');
  String get deleteEnvelopeConfirm => get('deleteEnvelopeConfirm');
  String get transfer => get('transfer');
  String get from => get('from');
  String get to => get('to');
  String get amount => get('amount');
  String get note => get('note');
  String get confirm => get('confirm');
  String get recurringBills => get('recurringBills');
  String get addBill => get('addBill');
  String get editBill => get('editBill');
  String get billName => get('billName');
  String get dayOfMonth => get('dayOfMonth');
  String get active => get('active');
  String get monthlyReset => get('monthlyReset');
  String get monthlyResetConfirm => get('monthlyResetConfirm');
  String get reset => get('reset');
  String get noEnvelopes => get('noEnvelopes');
  String get createFirst => get('createFirst');
  String get noTransactions => get('noTransactions');
  String get addFirst => get('addFirst');
  String get description => get('description');
  String get date => get('date');
  String get attachReceipt => get('attachReceipt');
  String get viewReceipt => get('viewReceipt');
  String get freeLimitReached => get('freeLimitReached');
  String get freeLimitMessage => get('freeLimitMessage');
  String get exportSuccess => get('exportSuccess');
  String get importSuccess => get('importSuccess');
  String get error => get('error');
  String get selectEnvelope => get('selectEnvelope');
  String get allEnvelopes => get('allEnvelopes');
  String get thisMonth => get('thisMonth');
  String get lastMonth => get('lastMonth');
  String get custom => get('custom');
  String get general => get('general');
  String get currency => get('currency');
  String get language => get('language');
  String get about => get('about');
  String get restorePurchases => get('restorePurchases');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'de', 'es', 'uk'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
