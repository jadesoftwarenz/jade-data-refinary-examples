jadeVersionNumber "99.0.00";
schemaDefinition
BankModelSchema subschemaOf RootSchema completeDefinition;
constantDefinitions
	categoryDefinition ModelErrorCodes
		InvalidDirectoryPath:          Integer = 150019;
localeDefinitions
	5129 "English (New Zealand)" schemaDefaultLocale;
	1033 "English (United States)" _cloneOf 5129;
typeHeaders
	BankModelSchema subclassOf RootSchemaApp transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, highestOrdinal = 1, number = 2137;
	Bank subclassOf Object highestSubId = 4, highestOrdinal = 5, number = 2138;
	BankEntity subclassOf Object highestOrdinal = 1, number = 2139;
	Account subclassOf BankEntity highestSubId = 3, highestOrdinal = 12, number = 2140;
	Card subclassOf BankEntity number = 2141;
	Customer subclassOf BankEntity highestOrdinal = 18, number = 2142;
	District subclassOf BankEntity highestSubId = 3, highestOrdinal = 10, number = 2143;
	Institute subclassOf BankEntity highestOrdinal = 1, number = 2144;
	Loan subclassOf BankEntity highestOrdinal = 11, dynamicPropertyCluster = "BankEntityCluster", number = 2145;
	Order subclassOf BankEntity highestOrdinal = 6, number = 2146;
	Transaction subclassOf BankEntity highestOrdinal = 13, number = 2147;
	CardTransaction subclassOf Transaction highestOrdinal = 3, number = 2121;
	CashTransaction subclassOf Transaction highestOrdinal = 2, number = 2119;
	TransferTransaction subclassOf Transaction highestOrdinal = 3, number = 2120;
	DataLoader subclassOf Object highestOrdinal = 6, number = 2122;
	GFCModelSchema subclassOf RootSchemaGlobal transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2123;
	SFCModelSchema subclassOf RootSchemaSession transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, highestOrdinal = 1, number = 2124;
	AccountByIdDict subclassOf MemberKeyDictionary number = 2125;
	CustomerByIdDict subclassOf MemberKeyDictionary number = 2126;
	DistrictByIdDict subclassOf MemberKeyDictionary number = 2127;
	LoanByIdDict subclassOf MemberKeyDictionary loadFactor = 66, number = 2053;
	OrderByIdDict subclassOf MemberKeyDictionary loadFactor = 66, number = 2054;
	TransactionByIdDict subclassOf MemberKeyDictionary number = 2128;
membershipDefinitions
	AccountByIdDict of Account;
	CustomerByIdDict of Customer;
	DistrictByIdDict of District;
	LoanByIdDict of Loan;
	OrderByIdDict of Order;
	TransactionByIdDict of Transaction;
typeDefinitions
	Object completeDefinition
	(
	)
	Application completeDefinition
	(
	)
	RootSchemaApp completeDefinition
	(
	)
	BankModelSchema completeDefinition
	(
	referenceDefinitions
		myRoot:                        Bank  number = 1, ordinal = 1;
	jadeMethodDefinitions
		initialize() updating, number = 1001;
		loadData(args: HugeStringArray) number = 1002;
		raiseModelException(errorNo: Integer) number = 1003;
	)
	Bank completeDefinition
	(
	attributeDefinitions
		name:                          String[101] protected, number = 1, ordinal = 1;
	referenceDefinitions
		allAccounts:                   AccountByIdDict   explicitInverse, readonly, subId = 1, number = 2, ordinal = 2;
		allCustomers:                  CustomerByIdDict   explicitInverse, readonly, subId = 2, number = 3, ordinal = 3;
		allDistricts:                  DistrictByIdDict   explicitInverse, subId = 3, number = 4, ordinal = 4;
		allTransactions:               TransactionByIdDict   explicitInverse, readonly, subId = 4, number = 5, ordinal = 5;
	jadeMethodDefinitions
		create(name: String) updating, number = 1001;
		createAccount(
			id: String; 
			district_id: Integer; 
			frequency: String; 
			date: Date; 
			name: String; 
			type: String): Account number = 1002;
		createCardTransaction(
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			cardNumber: String; 
			merchantId: String; 
			authCode: String): CardTransaction number = 1003;
		createCashTransaction(
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			branchCode: String; 
			tellerRef: String): CashTransaction number = 1004;
		createCustomer(
			id: String; 
			gender: String; 
			social: String; 
			firstName: String; 
			middleName: String; 
			lastName: String; 
			phone: String; 
			email: String; 
			address_1: String; 
			address_2: String; 
			city: String; 
			state: String; 
			zipcode: String; 
			district_id: Integer; 
			dob: Date) number = 1005;
		createDistrict(
			id: Integer; 
			city: String; 
			stateName: String; 
			stateAbbrev: String; 
			region: String; 
			division: String): District number = 1006;
		createLoan(
			id: String; 
			account_id: String; 
			amount: Decimal; 
			duration: Integer; 
			payments: Integer; 
			status: Character; 
			date: Date; 
			purpose: String): Loan number = 1016;
		createOrder(
			id: Integer64; 
			account_id: String; 
			bank_to: String; 
			account_to: Integer; 
			amount: Decimal; 
			k_symbol: String): Order number = 1017;
		createTransaction(
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String): Transaction number = 1007;
		createTransferTransaction(
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			transferRef: String; 
			clearingCode: String; 
			valueDate: Date): TransferTransaction number = 1008;
		getAccountById(id: String): Account number = 1009;
		getDistrictById(id: Integer): District number = 1010;
		getName(): String number = 1011;
		updateAccounts(doAbort: Boolean) number = 1012;
		updateCustomerSlobs() number = 1013;
		updateCustomers(doAbort: Boolean) number = 1014;
		updateFirstCustomer() number = 1015;
	)
	BankEntity completeDefinition
	(
	attributeDefinitions
		incarnation:                   Integer protected, number = 1, ordinal = 1;
	)
	Account completeDefinition
	(
	attributeDefinitions
		active:                        Boolean number = 1, ordinal = 1;
		date:                          Date readonly, number = 2, ordinal = 2;
		district_id:                   Integer readonly, number = 3, ordinal = 3;
		frequency:                     String[31] readonly, number = 4, ordinal = 4;
		id:                            String[13] readonly, number = 5, ordinal = 5;
		name:                          String[81] readonly, number = 9, ordinal = 9;
		type:                          String[17] readonly, number = 10, ordinal = 10;
	referenceDefinitions
		myBank:                        Bank   explicitEmbeddedInverse, readonly, number = 6, ordinal = 6;
		myDistrict:                    District   explicitEmbeddedInverse, readonly, number = 7, ordinal = 7;
		myLoans:                       LoanByIdDict   explicitInverse, subId = 2, number = 11, ordinal = 11;
		myOrders:                      OrderByIdDict   explicitInverse, readonly, subId = 3, number = 12, ordinal = 12;
		myTransactions:                TransactionByIdDict   explicitInverse, readonly, subId = 1, number = 8, ordinal = 8;
	jadeMethodDefinitions
		create(
			id: String; 
			district_id: Integer; 
			frequency: String; 
			date: Date; 
			name: String; 
			type: String; 
			parent: Bank; 
			district: District) updating, number = 1001;
		currentBalance(): Decimal number = 1002;
		getFirstTransaction(): Transaction refinery, number = 1003;
		getLastTransaction(): Transaction refinery, number = 1004;
	)
	Card completeDefinition
	(
	)
	Customer completeDefinition
	(
	attributeDefinitions
		active:                        Boolean number = 1, ordinal = 1;
		address_1:                     String subId = 1, number = 2, ordinal = 2;
		address_2:                     String subId = 2, number = 3, ordinal = 3;
		city:                          String[31] number = 4, ordinal = 4;
		dateOfBirth:                   Date number = 5, ordinal = 5;
		district_id:                   Integer number = 6, ordinal = 6;
		email:                         String[61] number = 7, ordinal = 7;
		firstName:                     String[31] number = 8, ordinal = 8;
		gender:                        String[7] number = 9, ordinal = 9;
		id:                            String[13] number = 10, ordinal = 10;
		lastName:                      String[31] number = 11, ordinal = 11;
		middleName:                    String[31] number = 12, ordinal = 12;
		phoneNumber:                   String[21] number = 13, ordinal = 13;
		ssn:                           String[13] number = 14, ordinal = 14;
		state:                         String[31] number = 15, ordinal = 15;
		zipCode:                       String[13] number = 16, ordinal = 16;
	referenceDefinitions
		myBank:                        Bank   explicitEmbeddedInverse, number = 17, ordinal = 17;
		myDistrict:                    District   explicitEmbeddedInverse, number = 18, ordinal = 18;
	jadeMethodDefinitions
		create(
			id: String; 
			gender: String; 
			social: String; 
			firstName: String; 
			middleName: String; 
			lastName: String; 
			phone: String; 
			email: String; 
			address_1: String; 
			address_2: String; 
			city: String; 
			state: String; 
			zipcode: String; 
			district_id: Integer; 
			date: Date; 
			parent: Bank; 
			district: District) updating, number = 1001;
		fullName(): String refinery, number = 1002;
	)
	District completeDefinition
	(
	attributeDefinitions
		city:                          String[31] number = 1, ordinal = 1;
		division:                      String[21] number = 2, ordinal = 2;
		id:                            Integer number = 3, ordinal = 3;
		region:                        String[13] number = 4, ordinal = 4;
		stateAbbrev:                   String[4] number = 5, ordinal = 5;
		stateName:                     String[31] number = 6, ordinal = 6;
	referenceDefinitions
		allAccounts:                   AccountByIdDict   explicitInverse, subId = 1, number = 7, ordinal = 7;
		allCustomers:                  CustomerByIdDict   explicitInverse, subId = 2, number = 8, ordinal = 8;
		allLoans:                      LoanByIdDict   explicitInverse, subId = 3, number = 10, ordinal = 10;
		myBank:                        Bank   explicitEmbeddedInverse, number = 9, ordinal = 9;
	jadeMethodDefinitions
		create(
			id: Integer; 
			city: String; 
			stateName: String; 
			stateAbbrev: String; 
			region: String; 
			division: String; 
			parent: Bank) updating, number = 1001;
		getCityRegionState(): String refinery, number = 1002;
		getNumberOfLoans(): Integer refinery, number = 1003;
	)
	Institute completeDefinition
	(
	attributeDefinitions
		id:                            Integer readonly, number = 1, ordinal = 1;
	jadeMethodDefinitions
		create(id: Integer) updating, number = 1001;
	)
	Loan completeDefinition
	(
	attributeDefinitions
		amount:                        Decimal[15,2] number = 2, ordinal = 2;
		date:                          Date number = 12, ordinal = 11;
		duration:                      Integer number = 3, ordinal = 3;
		id:                            String[13] readonly, number = 1, ordinal = 1;
		payments:                      Integer number = 4, ordinal = 4;
		purpose:                       String subId = 1, number = 11, ordinal = 1, dynamicPropertyCluster = "BankEntityCluster";
		status:                        Character number = 7, ordinal = 7;
	referenceDefinitions
		myAccount:                     Account   explicitEmbeddedInverse, number = 5, ordinal = 5;
		myDistrict:                    District   explicitEmbeddedInverse, number = 6, ordinal = 6;
	jadeMethodDefinitions
		create(
			id: String; 
			amount: Decimal; 
			duration: Integer; 
			payments: Integer; 
			status: Character; 
			date: Date; 
			purpose: String; 
			account: Account; 
			district: District) updating, number = 1001;
	)
	Order completeDefinition
	(
	attributeDefinitions
		account_to:                    Integer number = 6, ordinal = 6;
		amount:                        Decimal[15,2] number = 3, ordinal = 3;
		bank_to:                       String[7] number = 5, ordinal = 5;
		id:                            Integer64 readonly, number = 1, ordinal = 1;
		k_symbol:                      String[26] number = 4, ordinal = 4;
	referenceDefinitions
		myAccount:                     Account   explicitEmbeddedInverse, subschemaHidden, number = 2, ordinal = 2;
	jadeMethodDefinitions
		create(
			id: Integer64; 
			bank_to: String; 
			account_to: Integer; 
			amount: Decimal; 
			k_symbol: String; 
			account: Account) updating, number = 1001;
	)
	Transaction completeDefinition
	(
	attributeDefinitions
		amount:                        Decimal[15,2] number = 2, ordinal = 2;
		id:                            String[13] number = 3, ordinal = 3;
		k_symbol:                      String[26] number = 4, ordinal = 4;
		operation:                     String[31] number = 5, ordinal = 5;
		otherBank:                     String[31] number = 7, ordinal = 7;
		smoketestFlag:                 Boolean number = 1, ordinal = 13;
		timestamp:                     TimeStamp number = 8, ordinal = 8;
		type:                          String[11] number = 9, ordinal = 9;
	referenceDefinitions
		myAccount:                     Account   explicitEmbeddedInverse, readonly, number = 10, ordinal = 10;
		myBank:                        Bank   explicitEmbeddedInverse, readonly, number = 11, ordinal = 11;
		myOtherAccount:                Account  readonly, number = 12, ordinal = 12;
	jadeMethodDefinitions
		create(
			id: String; 
			timestamp: TimeStamp; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			parent: Bank; 
			account: Account) updating, number = 1001;
		currentBalance(): Decimal refinery, number = 1002;
	)
	CardTransaction completeDefinition
	(
	attributeDefinitions
		authCode:                      String[8] number = 1, ordinal = 1;
		cardNumber:                    String[21] number = 2, ordinal = 2;
		merchantId:                    String[17] number = 3, ordinal = 3;
	jadeMethodDefinitions
		create(
			id: String; 
			timestamp: TimeStamp; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			parent: Bank; 
			account: Account; 
			cardNumber: String; 
			merchantId: String; 
			authCode: String) updating, number = 1001;
	)
	CashTransaction completeDefinition
	(
	attributeDefinitions
		branchCode:                    String[10] number = 1, ordinal = 1;
		tellerRef:                     String[13] number = 2, ordinal = 2;
	jadeMethodDefinitions
		create(
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			parent: Bank; 
			account: Account; 
			branchCode: String; 
			tellerRef: String) updating, number = 1001;
	)
	TransferTransaction completeDefinition
	(
	attributeDefinitions
		clearingCode:                  String[8] number = 1, ordinal = 1;
		transferRef:                   String[20] number = 2, ordinal = 2;
		valueDate:                     Date number = 3, ordinal = 3;
	jadeMethodDefinitions
		create(
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String; 
			parent: Bank; 
			account: Account; 
			transferRef: String; 
			clearingCode: String; 
			valueDate: Date) updating, number = 1001;
	)
	DataLoader completeDefinition
	(
	attributeDefinitions
		countBase:                     Integer protected, number = 1, ordinal = 1;
		countCard:                     Integer protected, number = 2, ordinal = 2;
		countCash:                     Integer protected, number = 3, ordinal = 3;
		countTransfer:                 Integer protected, number = 4, ordinal = 4;
		dataDirectory:                 String[301] protected, number = 5, ordinal = 5;
	referenceDefinitions
		myRoot:                        Bank  protected, number = 6, ordinal = 6;
	jadeMethodDefinitions
		closeJournal() protected, number = 1001;
		convertToTimeStamp(string: String): TimeStamp protected, number = 1002;
		create() updating, number = 1003;
		getElapsedTimeString(startClock: Integer): String typeMethod, number = 1004;
		handlException(
			e: Exception; 
			currentRecord: String): Integer protected, number = 1005;
		loadAccount(attributes: JadeRegexResult) protected, number = 1006;
		loadCardTransaction(
			attributes: JadeRegexResult; 
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String) protected, number = 1007;
		loadCashTransaction(
			attributes: JadeRegexResult; 
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String) protected, number = 1008;
		loadCustomer(attributes: JadeRegexResult) protected, number = 1009;
		loadData(
			directoryPath: String; 
			maxRecords: Integer) updating, number = 1010;
		loadDistrict(attributes: JadeRegexResult) protected, number = 1011;
		loadLoan(attributes: JadeRegexResult) protected, number = 1017;
		loadOrder(attributes: JadeRegexResult) protected, number = 1018;
		loadRecords(
			fileName: String; 
			loadRecordMethod: JadeMethod; 
			commitModulus: Integer; 
			maxRecords: Integer) protected, number = 1012;
		loadTransaction(attributes: JadeRegexResult) updating, protected, number = 1013;
		loadTransferTransaction(
			attributes: JadeRegexResult; 
			id: String; 
			timestamp: TimeStamp; 
			account_id: String; 
			type: String; 
			operation: String; 
			amount: Decimal; 
			k_symbol: String; 
			otherBank: String; 
			otherAccount: String) protected, number = 1014;
		makeBank(name: String) updating, protected, number = 1015;
		validateDirectoryPath(directoryPath: String): String protected, number = 1016;
	)
	Global completeDefinition
	(
	)
	RootSchemaGlobal completeDefinition
	(
	)
	GFCModelSchema completeDefinition
	(
	)
	JadePaginationEnvelope completeDefinition
	(
	)
	JadeRestService completeDefinition
	(
	)
	JadeScript completeDefinition
	(
	constantDefinitions
		NumSmoketestEvents:            Integer = 1000 number = 1001;
	jadeMethodDefinitions
		closeJournal() number = 1001;
		generateDescriptionFile() number = 1002;
		getCurrentJournalOffset(
			currentJournal: Integer64 output; 
			currentOffset: Integer64 output) number = 1003;
		getTransaction() number = 1004;
		hasLoaded() number = 1022;
		loadData() number = 1005;
		loadData2() number = 1024;
		loadDataWithDialog() number = 1023;
		purgeCustomers() number = 1006;
		purgeData() number = 1007;
		purgeTransactions() number = 1008;
		removeBank() number = 1009;
		runSmoketest() number = 1021;
		setCaptureState() number = 1010;
		setupSmoketest(param: String) number = 1020;
		startCapture() number = 1011;
		startCaptureAtCurrent() number = 1012;
		startRefineryCC() number = 1018;
		stopCapture() number = 1013;
		stopRefineryCC() number = 1019;
		updateAccounts() number = 1014;
		updateCustomerSlobs() number = 1015;
		updateCustomers() number = 1016;
		updateFirstCustomer() number = 1017;
	)
	WebSession completeDefinition
	(
	)
	RootSchemaSession completeDefinition
	(
	)
	SFCModelSchema completeDefinition
	(
	attributeDefinitions
		sessionState_userId:           Integer readonly, number = 1, ordinal = 1;
	)
	Collection completeDefinition
	(
	)
	Btree completeDefinition
	(
	)
	Dictionary completeDefinition
	(
	)
	MemberKeyDictionary completeDefinition
	(
	)
	AccountByIdDict completeDefinition
	(
	)
	CustomerByIdDict completeDefinition
	(
	)
	DistrictByIdDict completeDefinition
	(
	)
	LoanByIdDict completeDefinition
	(
	)
	OrderByIdDict completeDefinition
	(
	)
	TransactionByIdDict completeDefinition
	(
	)
memberKeyDefinitions
	AccountByIdDict completeDefinition
	(
		id;
	)
	CustomerByIdDict completeDefinition
	(
		id;
	)
	DistrictByIdDict completeDefinition
	(
		id;
	)
	LoanByIdDict completeDefinition
	(
		id;
	)
	OrderByIdDict completeDefinition
	(
		id;
	)
	TransactionByIdDict completeDefinition
	(
		id;
	)
inverseDefinitions
	allAccounts of Bank automaticDeferred parentOf myBank of Account manual;
	allCustomers of Bank automaticDeferred parentOf myBank of Customer manual;
	allDistricts of Bank automaticDeferred parentOf myBank of District manual;
	allTransactions of Bank automaticDeferred parentOf myBank of Transaction manual;
	allAccounts of District automatic peerOf myDistrict of Account manual;
	myAccount of Loan manual peerOf myLoans of Account automaticDeferred;
	myAccount of Order manual peerOf myOrders of Account automaticDeferred;
	myTransactions of Account automatic peerOf myAccount of Transaction manual;
	allCustomers of District automatic peerOf myDistrict of Customer manual;
	myDistrict of Loan manual peerOf allLoans of District automaticDeferred;

databaseDefinitions
	BankModelSchemaDb
	(
	databaseFileDefinitions
		"bank_data" number = 58;
		"transaction" number = 59;
		"bank_default" number = 60;
	defaultFileDefinition "bank_default";
	classMapDefinitions
		Account in "bank_data";
		AccountByIdDict in "bank_default";
		Bank in "bank_data";
		BankEntity in "bank_default";
		BankModelSchema in "_usergui";
		Card in "bank_data";
		CardTransaction in "transaction";
		CashTransaction in "transaction";
		Customer in "bank_data";
		CustomerByIdDict in "bank_default";
		DataLoader in "bank_default";
		District in "bank_data";
		DistrictByIdDict in "bank_data";
		GFCModelSchema in "bank_default";
		Institute in "bank_data";
		Loan in "bank_data";
		LoanByIdDict in "bank_default";
		Order in "bank_data";
		OrderByIdDict in "bank_default";
		SFCModelSchema in "_environ";
		Transaction in "transaction";
		TransactionByIdDict in "transaction";
		TransferTransaction in "transaction";
	)
typeSources
	BankModelSchema (
	jadeMethodSources
initialize
{
initialize() updating;

vars

begin
	self.myRoot := Bank.firstInstance;
end;
}
loadData
{
loadData(args : HugeStringArray);

// --------------------------------------------------------------------------------
// Method:      dataLoaderApp
//
// Purpose:     Method to initialize the database from CSV files.
//              This NON-Gui application initialize method takes the directory
//              as a command line argument.
//
//              jadclient schema=FCModelSchema app=DataLoader endJade DataFiles
// --------------------------------------------------------------------------------
constants
	NumberOfArgs 	= 1;
	FirstArgIndex 	= 1;
vars
	dataLoader : DataLoader;
	fileFolder : FileFolder;
	dirPath    : String;

begin
	// Check the command line has arguments
	if args = null or args.size <> NumberOfArgs then
		write "Example: jadclient schema=FCModelSchema app=DataLoader end DataFiles";
		return;
	endif;
	
	// Get the directory containing the initial data files from the command line
	create fileFolder transient;
	dirPath := args[FirstArgIndex];
	if dirPath <> null then
		// Create our data loader and initialize the database
		create dataLoader transient;
		dataLoader.loadData(dirPath, Max_Integer);
	endif;
	
epilog
	delete dataLoader; // does nothing if dataLoader is null
	delete fileFolder; // does nothing if fileFolder is null
	
	terminate;
end;
}
raiseModelException
{
raiseModelException(errorNo : Integer);
// --------------------------------------------------------------------------------
// Method:		raiseModelException
//
// Purpose:		Raises an exception of type ModelException.
//              The errorCode of the exception is set to the supplied error number.
// --------------------------------------------------------------------------------
vars
//	exceptionObject : ModelException;
	
exceptionObject : Exception;	

begin
	create exceptionObject transient;
	exceptionObject.errorCode := errorNo;
	exceptionObject.errorItem := errorNo.String;
	// FIXME
	// exceptionObject.errorItem := self.getErrorString(errorNo);
	raise exceptionObject;
end;
}
	)
	Bank (
	jadeMethodSources
create
{
create(name : String) updating;

vars

begin
	self.name := name;
end;
}
createAccount
{
createAccount(id : String; district_id : Integer; frequency : String; date : Date; name : String; type : String) : Account;

vars
	account : Account;
begin
	account := create Account(id, district_id, frequency, date, name, type, self, getDistrictById(district_id));
	return account;
end;
}
createCardTransaction
{
createCardTransaction(id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; cardNumber : String; merchantId : String; authCode : String) : CardTransaction;

vars
	transaction : CardTransaction;
begin
	transaction := create CardTransaction(id, timestamp, type, operation, amount, k_symbol, otherBank, otherAccount, self, getAccountById(account_id), cardNumber, merchantId, authCode);
	return transaction;
end;
}
createCashTransaction
{
createCashTransaction(id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; branchCode : String; tellerRef : String) : CashTransaction;

vars
	transaction : CashTransaction;
begin
	transaction := create CashTransaction(id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount, self, getAccountById(account_id), branchCode, tellerRef);
	return transaction;
end;
}
createCustomer
{
createCustomer(id : String; gender: String; social : String; firstName: String; middleName : String; lastName : String; phone: String;  email: String; address_1 : String; address_2 : String; city : String; state : String; zipcode : String; district_id: Integer;  dob : Date);

vars
	client : Customer;
begin
	client := create Customer(id, gender, social, firstName, middleName, lastName, phone, email, address_1, address_2, city, state, zipcode, district_id, dob, self, getDistrictById(district_id));
end;
}
createDistrict
{
createDistrict(id : Integer; city : String; stateName : String; stateAbbrev : String; region : String; division : String) : District;

vars
	district : District;
begin
	district := create District(id, city, stateName, stateAbbrev, region, division, self);
	return district;
end;
}
createLoan
{
createLoan(id : String; account_id : String; amount : Decimal; duration : Integer; payments : Integer; status : Character; date : Date; purpose : String) : Loan;

vars
	loan    : Loan;
	account : Account;
	district : District;
begin
	account := getAccountById(account_id);
	if account <> null then
		district := account.myDistrict;
	endif;
	
	loan := create Loan(id, amount, duration, payments, status, date, purpose, account, district);
	return loan;
end;
}
createOrder
{
createOrder(id : Integer64; account_id : String; bank_to : String; account_to : Integer; amount : Decimal; k_symbol : String) : Order;

vars
	order : Order;
begin
	order := create Order(id, bank_to, account_to, amount, k_symbol, getAccountById(account_id));
	return order;
end;
}
createTransaction
{
createTransaction(id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String) : Transaction	;

vars
	transaction : Transaction;
begin
	transaction := create Transaction(id, timestamp, type, operation, amount, k_symbol, otherBank, otherAccount, self, getAccountById(account_id));
	return transaction;
end;
}
createTransferTransaction
{
createTransferTransaction(id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; transferRef : String; clearingCode : String; valueDate : Date) : TransferTransaction;

vars
	transaction : TransferTransaction;
begin
	transaction := create TransferTransaction(id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount, self, getAccountById(account_id), transferRef, clearingCode, valueDate);
	return transaction;
end;
}
getAccountById
{
getAccountById(id : String) : Account;
begin
	return allAccounts[id];
end;
}
getDistrictById
{
getDistrictById(id : Integer) : District;
begin
	return allDistricts[id];
end;
}
getName
{
getName(): String;

vars

begin
	return name;
end;
}
updateAccounts
{
updateAccounts(doAbort : Boolean);
vars
	account : Account;
	count : Integer;
begin
	foreach account in self.allAccounts do
		account.active := true;
		count := count + 1;
		if doAbort and count < 500 then 
			process.setObjectCachePriority(account, 0);
		endif;
		if doAbort and count = 500 then
			abortTransaction;
			beginTransaction;
		elseif count mod 500 = 0 then
			commitTransaction;
			beginTransaction;
		endif;		
	endforeach;
end;
}
updateCustomerSlobs
{
updateCustomerSlobs();
vars
	customer : Customer;
	count : Integer;
begin
	foreach customer in self.allCustomers do
		customer.address_1 &= ">";
		customer.address_2 &= "#";
		count := count + 1;
		if count mod 500 = 0 then
			commitTransaction;
			beginTransaction;
		endif;		
	endforeach;
end;
}
updateCustomers
{
updateCustomers(doAbort : Boolean);
vars
	customer : Customer;
	count : Integer;
begin
	foreach customer in self.allCustomers do
		customer.active := true;
		customer.address_1 := customer.address_1 & "#";
		customer.address_2 := customer.address_2 & "$";
		count := count + 1;
		if doAbort and count < 500 then 
			process.setObjectCachePriority(customer, 0);
		endif;
		if doAbort and count = 500 then
			abortTransaction;
			beginTransaction;
		elseif count mod 500 = 0 then
			commitTransaction;
			beginTransaction;
		endif;		
	endforeach;
end;
}
updateFirstCustomer
{
updateFirstCustomer();
vars
	customer : Customer;
begin
	foreach customer in self.allCustomers do
		customer.address_1 := customer.address_1 & " -- updated";
		break;
	endforeach;
end;
}
	)
	Account (
	jadeMethodSources
create
{
create(id : String; district_id : Integer; frequency : String; date : Date; name : String; type : String; parent : Bank; district : District) updating;
begin
	self.id := id;
	self.district_id := district_id;
	self.frequency := frequency;
	self.date := date;
	self.name := name;
	self.type := type;
	self.myDistrict := district;
	self.myBank := parent;
end;
}
currentBalance
{
currentBalance() : Decimal;
// --------------------------------------------------------------------------------
// Method:		currentBalance
//
// Purpose:		Computes the current account balance by summing all transactions.
//              Credits increase the balance;
//              all other transaction types (debits, withdrawals) decrease it.
// --------------------------------------------------------------------------------
vars
	balance     : Decimal[15,2];
	transaction : Transaction;
begin
	foreach transaction in self.myTransactions do
		if transaction.type = "Credit" then
			balance += transaction.amount;
		elseif transaction.type = "Debit" then
			balance -= transaction.amount;
		else
			// Unknown type - treat as debit and log
			balance -= transaction.amount;
			write "** currentBalance: unknown transaction type '" & transaction.type & "' on account " & self.id;
		endif;
	endforeach;
	return balance;
end;

}
getFirstTransaction
{
getFirstTransaction() : Transaction refinery;

vars

begin
	return myTransactions.first();
end;

}
getLastTransaction
{
getLastTransaction() : Transaction refinery;

vars

begin
	return myTransactions.last();
end;

}
	)
	Customer (
	jadeMethodSources
create
{
create(id : String; gender: String; social : String; firstName: String; middleName : String; lastName : String; phone: String;  email: String; address_1 : String; address_2 : String; city : String; state : String; zipcode : String; district_id: Integer;  date : Date; parent : Bank; district : District) updating;

vars

begin
	self.id := id;
	self.gender := gender;
	self.ssn := social;
	self.firstName := firstName;
	self.middleName := middleName;
	self.lastName := lastName;
	self.phoneNumber := phone;
	self.email := email;
	self.address_1 := address_1;
	self.address_2 := address_2;
	self.city := city;
	self.state := state;
	self.zipCode := zipcode;
	self.district_id := district_id;
	self.dateOfBirth := date;
	self.myDistrict := district;
	self.myBank := parent;
end;
}
fullName
{
fullName() : String refinery;
begin
	return firstName & ' ' & middleName & ' ' & lastName;
end;

}
	)
	District (
	jadeMethodSources
create
{
create(id : Integer; city : String; stateName : String; stateAbbrev : String; region : String; division : String; parent : Bank) updating;

vars

begin
	self.id := id;
	self.city := city;
	self.stateName := stateName;
	self.stateAbbrev := stateAbbrev;
	self.region := region;
	self.division := division;
	self.myBank := parent;
end;
}
getCityRegionState
{
getCityRegionState() :String refinery;

vars
	location : String;
begin

	if city <> null then
		location := city;
	endif;
	
	if region <> null then
		if location <> null then
			location &= ", ";
		endif;
		location &= region;
	endif;
	
	if stateName <> null then
		if location <> null then
			location &= ", ";
		endif;
		location &= stateName;
	endif;
	return location;
end;

}
getNumberOfLoans
{
getNumberOfLoans() :Integer refinery;

vars

begin
	return allLoans.size();
end;

}
	)
	Institute (
	jadeMethodSources
create
{
create(id: Integer) updating;

begin
	self.id := id;
end;

}
	)
	Loan (
	jadeMethodSources
create
{
create(id: String; amount: Decimal; duration: Integer; payments: Integer; status: Character; date: Date; purpose: String; account: Account; district: District) updating;

begin
	self.id := id;
	self.amount := amount;
	self.duration := duration;
	self.payments := payments;
	self.status := status;
	self.date := date;
	self.purpose := purpose;
	self.myAccount := account;
	self.myDistrict := district;
end;

}
	)
	Order (
	jadeMethodSources
create
{
create(id: Integer64; bank_to: String; account_to: Integer; amount: Decimal; k_symbol: String; account: Account) updating;

begin
	self.id := id;
	self.bank_to := bank_to;
	self.account_to := account_to;
	self.amount := amount;
	self.k_symbol := k_symbol;
	self.myAccount := account;
end;

}
	)
	Transaction (
	jadeMethodSources
create
{
create(id : String; timestamp : TimeStamp; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; parent : Bank; account : Account) updating;

vars

begin
	self.id := id;
	self.timestamp := timestamp;
	self.type := type;
	self.operation := operation;
	self.amount := amount;
	self.k_symbol := k_symbol;
	self.otherBank := otherBank;
	self.myBank := parent;
	self.myAccount := account;
	if otherAccount <> null and otherAccount <> "" and parent.allAccounts.includesKey(otherAccount) then
		self.myOtherAccount := parent.allAccounts[otherAccount];
	endif;
end;
}
currentBalance
{
currentBalance() : Decimal refinery;

vars

begin
	return myAccount.currentBalance();
end;

}
	)
	CardTransaction (
	jadeMethodSources
create
{
create(id : String; timestamp : TimeStamp; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; parent : Bank; account : Account; cardNumber : String; merchantId : String; authCode : String) ::super(id, timestamp, type, operation, amount, k_symbol, otherBank, otherAccount, parent, account) updating;

vars

begin

	self.cardNumber := cardNumber;
	self.merchantId := merchantId;
	self.authCode := authCode;
end;
}
	)
	CashTransaction (
	jadeMethodSources
create
{
create(id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; parent : Bank; account : Account; branchCode : String; tellerRef : String) ::super(id, timestamp, type, operation, amount, k_symbol, otherBank, otherAccount, parent, account) updating;

vars

begin
	self.branchCode := branchCode;
	self.tellerRef := tellerRef;
end;
}
	)
	TransferTransaction (
	jadeMethodSources
create
{
create(id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String; parent : Bank; account : Account; transferRef : String; clearingCode : String; valueDate : Date) ::super(id, timestamp, type, operation, amount, k_symbol, otherBank, otherAccount, parent, account) updating;

vars

begin

	self.transferRef := transferRef;
	self.clearingCode := clearingCode;
	self.valueDate := valueDate;
end;
}
	)
	DataLoader (
	jadeMethodSources
closeJournal
{
closeJournal() protected;

vars
	dba : JadeDatabaseAdmin;
begin
	create dba transient;
	dba.closeCurrentJournal();
epilog
	delete dba;
end;
}
convertToTimeStamp
{
convertToTimeStamp(string : String) : TimeStamp protected;

vars
	timeStamp : TimeStamp;
	index : Integer;
begin
	
	index := 1;
	
	timeStamp.setDate(string.scanUntil("T", index).Date);
	timeStamp.setTime(string[index+1:end].Time);
	
	return timeStamp;
	
end;
}
create
{
create() updating;

vars

begin
	myRoot := Bank.firstInstance();
end;
}
getElapsedTimeString
{
getElapsedTimeString(startClock : Integer) : String typeMethod;
vars
	elapsedTime : Integer;

begin
	elapsedTime := (app.clock - startClock) div 1000;
	if elapsedTime < 1 then
		return "less than 1 second";
	endif;
	return elapsedTime.String & " seconds";
end;
}
handlException
{
handlException(e : Exception; currentRecord : String) : Integer protected;

vars

begin
	if e.errorCode = 1310 then
		write "** duplicated key error ** - " & e.errorObject.String;
		write "are you loading the same data set again?";
	else
		write "** error: (" & e.errorCode.String & ") - " &  e.text() & ", current record: " & currentRecord;
	endif;
	
	return Ex_Abort_Action;
end;
}
loadAccount
{
loadAccount(attributes : JadeRegexResult) protected;
vars
	account_id		: String;
	district_id		: Integer;
	frequency		: String;
	date			: Date;
	name			: String;
	type			: String;

begin
	if attributes.numMatches < 10 then
		NormalException.raise_(JErr_Regex_Failed, method.name);
	endif;

	account_id := attributes.at(1).value;
	district_id := attributes.at(2).value.Integer;
	frequency := attributes.at(3).value;
	date   := attributes.at(4).value.Date;
	name := attributes.at(9).value;
	type := attributes.at(10).value;

	self.myRoot.createAccount(account_id, district_id, frequency, date, name, type);
end;
}
loadCardTransaction
{
loadCardTransaction(attributes : JadeRegexResult; id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String) protected;
vars
	cardNumber : String;
	merchantId : String;
	authCode : String;

begin
	cardNumber := attributes.at(11).value;
	merchantId := attributes.at(12).value;
	authCode := attributes.at(13).value;

	self.myRoot.createCardTransaction(id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount, cardNumber, merchantId, authCode);
end;
}
loadCashTransaction
{
loadCashTransaction(attributes : JadeRegexResult; id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String) protected;
vars
	branchCode : String;
	tellerRef : String;

begin
	branchCode := attributes.at(11).value;
	tellerRef := attributes.at(12).value;

	self.myRoot.createCashTransaction(id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount, branchCode, tellerRef);
end;
}
loadCustomer
{
loadCustomer(attributes : JadeRegexResult) protected;
vars
	id : String; 
	gender: String; 
	social : String; 
	firstName: String; 
	middleName : String; 
	lastName : String; 
	phone: String;  
	email: String; 
	address_1 : String; 
	address_2 : String; 
	city : String; 
	state : String; 
	zipcode : String; 
	district_id: Integer;  
	date : Date;
begin
	if attributes.numMatches < 20 then
		NormalException.raise_(JErr_Regex_Failed, method.name);
	endif;

	id := attributes.at(1).value;
	gender := attributes.at(2).value;
	social := attributes.at(8).value;
	firstName := attributes.at(9).value;	
	middleName := attributes.at(10).value;	
	lastName := attributes.at(11).value;	
	phone := attributes.at(12).value;	
	email := attributes.at(13).value;	
	address_1 := attributes.at(14).value;	
	address_2 := attributes.at(15).value;	
	city := attributes.at(16).value;	
	state := attributes.at(17).value;	
	zipcode := attributes.at(18).value;	
	district_id := attributes.at(19).value.Integer;	
	date := attributes.at(20).value.Date;

	self.myRoot.createCustomer(id, gender, social, firstName, middleName, lastName, phone, email, address_1, address_2, city, state, zipcode, district_id, date);
end;
}
loadData
{
loadData(directoryPath : String; maxRecords : Integer)  updating;
constants
	AccountFileName     : String = "account.csv";
	ClientFileName      : String = "client.csv";
	DistrictFileName    : String = "district.csv";
	LoanFileName        : String = "loan.csv";
	OrderFileName       : String = "order.csv";
	TransactionFileName : String = "transaction.csv";

vars
	startTime             : Integer;

begin
	// Get the initial time
	startTime := app.clock;

	// Ensure the supplied directory path is valid
	self.dataDirectory := self.validateDirectoryPath(directoryPath);

	if self.myRoot = null then
		makeBank("Union Bank");
	else
		write "** Warning ** found existing bank: " & self.myRoot.getName() & " - " & self.myRoot.String;
	endif;
	
	
	// Load data sets
	self.loadRecords(DistrictFileName, DataLoader::loadDistrict, 100, maxRecords);
	self.loadRecords(AccountFileName, DataLoader::loadAccount, 1000, maxRecords);
	self.loadRecords(ClientFileName, DataLoader::loadCustomer, 200, maxRecords);
	self.loadRecords(LoanFileName, DataLoader::loadLoan, 500, maxRecords);
	self.loadRecords(OrderFileName, DataLoader::loadOrder, 2000, maxRecords);
	self.loadRecords(TransactionFileName, DataLoader::loadTransaction, 1000, maxRecords);

	write "Data loaded in " & getElapsedTimeString(startTime);
	write "Transaction totals:";
	write "  Base Transaction:    " & self.countBase.String;
	write "  CashTransaction:     " & self.countCash.String;
	write "  TransferTransaction: " & self.countTransfer.String;
	write "  CardTransaction:     " & self.countCard.String;
	write "  Total:               " & (self.countBase + self.countCash + self.countTransfer + self.countCard).String;
end;
}
loadDistrict
{
loadDistrict(attributes : JadeRegexResult) protected;
vars
	id : Integer;
	city : String;
	stateName : String;
	stateAbbrev : String;
	region : String;
	division : String;
begin
	if attributes.numMatches < 6 then
		NormalException.raise_(JErr_Regex_Failed, method.name);
	endif;
	
	id := attributes.at(1).value.Integer;
	city := attributes.at(2).value;
	stateName := attributes.at(3).value;
	stateAbbrev := attributes.at(4).value;
	region := attributes.at(5).value;
	division := attributes.at(6).value;

	self.myRoot.createDistrict(id, city, stateName, stateAbbrev, region, division);
end;
}
loadLoan
{
loadLoan(attributes : JadeRegexResult) protected;
vars
	id         : String;
	account_id : String;
	amount     : Decimal[15,2];
	duration   : Integer;
	payments   : Integer;
	status     : Character;
	date       : Date;
	purpose    : String;

begin
	if attributes.numMatches < 12 then
		NormalException.raise_(JErr_Regex_Failed, method.name);
	endif;

	id         := attributes.at(1).value;
	account_id := attributes.at(2).value;
	amount     := attributes.at(3).value.Decimal;
	duration   := attributes.at(4).value.Integer;
	payments   := attributes.at(5).value.Integer;
	status     := attributes.at(6).value[1];
	date       := attributes.at(10).value.Date;	// fulldate column
	purpose    := attributes.at(12).value;

	self.myRoot.createLoan(id, account_id, amount, duration, payments, status, date, purpose);
end;
}
loadOrder
{
loadOrder(attributes : JadeRegexResult) protected;
vars
	id         : Integer64;
	account_id : String;
	bank_to    : String;
	account_to : Integer;
	amount     : Decimal[15,2];
	k_symbol   : String;

begin
	if attributes.numMatches < 6 then
		NormalException.raise_(JErr_Regex_Failed, method.name);
	endif;

	id         := attributes.at(1).value.Integer64;
	account_id := attributes.at(2).value;
	bank_to    := attributes.at(3).value;
	account_to := attributes.at(4).value.Integer;
	amount     := attributes.at(5).value.Decimal;
	k_symbol   := attributes.at(6).value;

	self.myRoot.createOrder(id, account_id, bank_to, account_to, amount, k_symbol);
end;
}
loadRecords
{
loadRecords(fileName : String; loadRecordMethod : JadeMethod; commitModulus : Integer; maxRecords : Integer) protected;
vars
	pattern	: JadeRegexPattern;
    splits : JadeRegexResult;
	inputFile : File;
	record : String;
	startClock : Integer;
	count : Integer;

begin
	create pattern;
	pattern.setIgnoreEmptyMatches(false);
	pattern.compile(',');
	
	startClock := app.clock;

	create inputFile transient;	
	inputFile.allowCreate := false;
	inputFile.allowReplace := false;
	inputFile.kind := File.Kind_Unknown_Text;
	inputFile.mode := File.Mode_Input;
	inputFile.fileName := self.dataDirectory & fileName;
	if not inputFile.isAvailable() then
		write "** error: " & inputFile.fileName & " not found";
		return;
	endif;

	on Exception do handlException(exception, record);
	
	write "Loading " & inputFile.fileName & "...";
	
	beginTransaction;
	// read and ignore header
	record := inputFile.readLine.trimBlanks;
	while not inputFile.endOfFile do
		record := inputFile.readLine.trimBlanks;
		// Empty lines  are skipped
		if record <> null then
			pattern.split(record, splits);
			invokeMethod(appContext, loadRecordMethod, splits);
		endif;
		count := count + 1;
		if count = maxRecords then
			break;
		endif;
		if count mod commitModulus = 0 then
			commitTransaction;
			beginTransaction;
			write "  " & count.String & " records in " & getElapsedTimeString(startClock);
		endif;
	endwhile;
	commitTransaction;

	write count.String & " records loaded in " & getElapsedTimeString(startClock);

epilog
	delete pattern;
	delete inputFile;
end;
}
loadTransaction
{
loadTransaction(attributes : JadeRegexResult) protected, updating;
vars
	id : String; 
	timestamp : TimeStamp; 
	account_id : String; 
	type : String; 
	operation : String; 
	amount : Decimal[15,2]; 
	k_symbol : String; 
	otherBank : String; 
	otherAccount : String; 
	subclassType : String;

begin
	if attributes.numMatches < 9 then
		NormalException.raise_(JErr_Regex_Failed, method.name);
	endif;

	account_id := attributes.at(1).value;
	timestamp := convertToTimeStamp(attributes.at(2).value);
	id := attributes.at(3).value;
	type := attributes.at(4).value;
	operation := attributes.at(5).value;
	amount := attributes.at(6).value.Decimal;
	k_symbol := attributes.at(7).value;
	otherBank := attributes.at(8).value;
	otherAccount := attributes.at(9).value;

	// Extended format: column 10 contains subclass type discriminator
	if attributes.numMatches >= 10 then
		subclassType := attributes.at(10).value;
	endif;

	if subclassType = "Cash" then
		self.countCash += 1;
		self.loadCashTransaction(attributes, id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount);
	elseif subclassType = "Transfer" then
		self.countTransfer += 1;
		self.loadTransferTransaction(attributes, id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount);
	elseif subclassType = "Card" then
		self.countCard += 1;
		self.loadCardTransaction(attributes, id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount);
	else
		self.countBase += 1;
		self.myRoot.createTransaction(id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount);
	endif;
end;
}
loadTransferTransaction
{
loadTransferTransaction(attributes : JadeRegexResult; id : String; timestamp : TimeStamp; account_id : String; type : String; operation : String; amount : Decimal; k_symbol : String; otherBank : String; otherAccount : String) protected;
vars
	transferRef : String;
	clearingCode : String;
	valueDate : Date;

begin
	transferRef := attributes.at(11).value;
	clearingCode := attributes.at(12).value;
	if attributes.at(13).value <> null then
		valueDate := attributes.at(13).value.Date;
	endif;

	self.myRoot.createTransferTransaction(id, timestamp, account_id, type, operation, amount, k_symbol, otherBank, otherAccount, transferRef, clearingCode, valueDate);
end;
}
makeBank
{
makeBank(name : String) updating, protected;

vars

begin
	beginTransaction;
	// Create our singleton persistent Bank
	self.myRoot := create Bank(name) persistent;
	commitTransaction;
end;
}
validateDirectoryPath
{
validateDirectoryPath(directoryPath : String) : String protected;
// --------------------------------------------------------------------------------
// Method:		zValidateDirectoryPath
//
// Purpose:		Validates a directory path. Raises an InvalidDirectoryPath
//              ModelException if the path is not valid.
//
// Returns:     The directory path with a "/" suffix
// --------------------------------------------------------------------------------
vars
	returnDirPath : String;
	dir           : FileFolder;

begin
	returnDirPath := directoryPath.trimBlanks;

	if returnDirPath.length <= 0 then
		app.raiseModelException(InvalidDirectoryPath);
		return null;
	endif;

	if returnDirPath[returnDirPath.length] <> "/" and returnDirPath[returnDirPath.length] <> "\" then
		returnDirPath := returnDirPath & "/";
	endif;

	create dir transient;

	if not dir.isValidPathName(returnDirPath) then
		app.raiseModelException(InvalidDirectoryPath);
		return null;
	endif;

	dir.fileName := returnDirPath;
	if not dir.isAvailable then
		app.raiseModelException(InvalidDirectoryPath);
		return null;
	endif;

	return returnDirPath;

epilog
	delete dir; // does nothing if dir is null
end;
}
	)
	JadeScript (
	jadeMethodSources
closeJournal
{
closeJournal();

vars
	dba : JadeDatabaseAdmin;
begin
	create dba transient;
	dba.closeCurrentJournal();
	write dba.getCurrentJournalName();
epilog
	delete dba;
end;
}
generateDescriptionFile
{
generateDescriptionFile();
vars
	jaa : JadeAuditAccess;
begin
	create jaa transient;
	beginTransaction;
	write jaa.descriptionPath;
	jaa.generateDescription();
	commitTransaction;
epilog
	delete jaa;
end;
}
getCurrentJournalOffset
{
getCurrentJournalOffset(currentJournal: Integer64 output; currentOffset : Integer64 output);
vars
	unused : Integer64;
	dba : JadeDatabaseAdmin;
begin
	create dba transient;
	dba.getCurrentJournalOffset(currentJournal, currentOffset, unused, unused, unused);
epilog
	delete dba;
end;
}
getTransaction
{
getTransaction();

vars
	bank : Bank;
	trans : Transaction;
begin
	bank := Bank.firstInstance();
	
	trans := bank.allTransactions["T00125727"];
	write trans.amount.getDeclaredPrecision;
	
end;
}
hasLoaded
{
hasLoaded();

begin
	if Account.instances.size >= NumSmoketestEvents
	then
		write "hasLoaded=True";
	else 
		write "hasLoaded=False";
	endif;
end;

}
loadData
{
loadData();
constants
	// TODO - source these from INI settings
	DataLoadPath : String = "d:\src\jade-data-refinery-tools\resources\banking-demo-data";
	MaxRecords : Integer = 1000;

vars
	dataLoader : DataLoader;

begin
	create dataLoader transient;
	dataLoader.loadData(DataLoadPath, MaxRecords);

epilog
	delete dataLoader; 
end;
}
loadData2
{
loadData2();
constants
	// TODO - source these from INI settings
	DataLoadPath : String = "c:\development\git\jade-data-refinery-tools\resources\banking-demo-data";
	MaxRecords : Integer = 10000;

vars
	dataLoader : DataLoader;

begin
	create dataLoader transient;
	dataLoader.loadData(DataLoadPath, MaxRecords);

epilog
	delete dataLoader; 
end;
}
loadDataWithDialog
{
loadDataWithDialog();
constants
	MaxRecords : Integer = Max_Integer;

vars
	dataLoader : DataLoader;
	fileFolder : FileFolder;
	dirPath    : String;

begin
	create fileFolder transient;
	// Ask for the directory containing the initial data files
	dirPath := fileFolder.browseForFolder("Select data file directory", app.dbPath);
	if dirPath <> null then
		// Create our data loader and initialize the database
		create dataLoader transient;
		dataLoader.loadData(dirPath, MaxRecords);
	endif;

epilog
	delete dataLoader; 
	delete fileFolder; 
end;
}
purgeCustomers
{
purgeCustomers();

vars
	bank : Bank;
begin
	bank := Bank.firstInstance;
	beginTransaction;
	bank.allCustomers.purge();
	commitTransaction;

end;
}
purgeData
{
purgeData();

vars

begin
	purgeTransactions();

	beginTransaction;
	delete Bank.firstInstance;
	commitTransaction;
end;
}
purgeTransactions
{
purgeTransactions();

vars
	bank : Bank;
	transaction : Transaction;
	startClock : Integer;
	count : Integer;
begin
	bank := Bank.lastInstance();
	if bank = null then
		return;
	endif;
	startClock := app.clock();
	beginTransaction;
	foreach transaction in bank.allTransactions do
		count += 1;
		if count mod 50000 = 0 then
			commitTransaction;
			beginTransaction;
			write count.String & " transactions deleted in " & DataLoader@getElapsedTimeString(startClock);
		endif;
		delete transaction;
	endforeach;
	commitTransaction;

end;
}
removeBank
{
removeBank();

vars
	bank : Bank;
begin
	bank := Bank.lastInstance;
	beginTransaction;
	delete bank;
	commitTransaction;
end;
}
runSmoketest
{
runSmoketest();
vars
	transaction : Transaction;
begin
	beginTransaction;
		foreach transaction in Transaction.instances do
			transaction.smoketestFlag := true;
		endforeach;
	commitTransaction;
end;

}
setCaptureState
{
setCaptureState();

vars

begin
	system.setJournalChangeCaptureState(563, 0);
end;
}
setupSmoketest
{
setupSmoketest(param : String);

vars
	dataLoader : DataLoader;
	dataDir : String;
begin
	if(param = "") then
		write "Error, incorrect parameter passing."& CrLf & "Expecting executeParam=<demo-data-path>" & CrLf &  "Example: D:\src\jade-data-refinery-tools\resources\banking-demo-data";
		node.userExitCode := 1;
		terminate;
	endif;
	
	dataDir := param;
	
	create dataLoader transient;
	dataLoader.loadData(dataDir, NumSmoketestEvents);
epilog 
delete dataLoader;		
end;

}
startCapture
{
startCapture();

begin
	system.startJournalChangeCapture();
end;
}
startCaptureAtCurrent
{
startCaptureAtCurrent();

vars
	currentJournal: Integer64;
	currentOffset : Integer64;
begin
	getCurrentJournalOffset(currentJournal, currentOffset);
	system.setJournalChangeCaptureState(currentJournal, currentOffset);	
end;
}
startRefineryCC
{
startRefineryCC();

begin
	system.startRefineryChangeCapture();
end;
}
stopCapture
{
stopCapture();

vars

begin
	system.stopJournalChangeCapture();
end;
}
stopRefineryCC
{
stopRefineryCC();

begin
	system.stopRefineryChangeCapture();
end;
}
updateAccounts
{
updateAccounts();

vars
	bank : Bank;
begin
	bank := Bank.firstInstance();
	beginTransaction;
	bank.updateAccounts(false);
	commitTransaction;
end;
}
updateCustomerSlobs
{
updateCustomerSlobs();

vars
	bank : Bank;
begin
	bank := Bank.firstInstance();
	beginTransaction;
	bank.updateCustomerSlobs();
	commitTransaction;
end;
}
updateCustomers
{
updateCustomers();

vars
	bank : Bank;
begin
	bank := Bank.firstInstance();
	beginTransaction;
	bank.updateCustomers(false);
	commitTransaction;
end;
}
updateFirstCustomer
{
updateFirstCustomer();

vars
	bank : Bank;
begin
	bank := Bank.firstInstance();

	beginTransaction;
	bank.updateFirstCustomer;
	commitTransaction;
end;
}
	)
