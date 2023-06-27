# Read data and remove first 11 rows and first 16 columns, with pandas
my_data = pd.read_excel(my_file, sheet_name="raw_data", header=None, skiprows=11, usecols=lambda x: x not in range(16))
