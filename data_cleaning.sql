SELECT TOP (1000) [customerID]
      ,[gender]
      ,[SeniorCitizen]
      ,[Partner]
      ,[Dependents]
      ,[tenure]
      ,[PhoneService]
      ,[MultipleLines]
      ,[InternetService]
      ,[OnlineSecurity]
      ,[OnlineBackup]
      ,[DeviceProtection]
      ,[TechSupport]
      ,[StreamingTV]
      ,[StreamingMovies]
      ,[Contract]
      ,[PaperlessBilling]
      ,[PaymentMethod]
      ,[MonthlyCharges]
      ,[TotalCharges]
      ,[Churn]
  FROM [ChurnDB].[dbo].[CustomerRawData]


  select * from CustomerRawData

  ALTER TABLE CustomerRawData
ALTER COLUMN SeniorCitizen VARCHAR(10);


Update CustomerRawData
Set SeniorCitizen = 
    Case when SeniorCitizen = 1 Then 'Yes'
         when SeniorCitizen = 0  then 'No'
         Else SeniorCitizen 
         end;


Update CustomerRawData
set 
MultipleLines =case when MultipleLines = 'No phone service' then 'No' else MultipleLines End,
OnlineSecurity =case when OnlineSecurity = 'No internet service' then 'No' else OnlineSecurity End,
OnlineBackup = case when OnlineBackup =  'No internet service' then 'No' else OnlineBackup end,
DeviceProtection =case when DeviceProtection=  'No internet service' then 'No' else DeviceProtection END,
TechSupport = case when TechSupport = 'No internet service' then 'No' else TechSupport end,
StreamingTV = case when StreamingTV =  'No internet service' then 'No' else StreamingTV end, 
StreamingMovies = case when StreamingMovies =  'No internet service' then 'No' else StreamingMovies end;




DELETE FROM CustomerRawData
WHERE LTRIM(RTRIM(TotalCharges)) = '';

ALTER TABLE CustomerRawData
ALTER COLUMN TotalCharges float;



select * from CustomerRawData