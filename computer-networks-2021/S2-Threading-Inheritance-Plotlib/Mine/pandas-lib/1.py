# import xlsxwriter
# import os
import pandas as pd


try:
    df = pd.read_excel('Exc1.xlsx' , sheet_name='Sheet1')
    pdExcel_tr = df.transpose()
except:
    print("The folder does not found!")
    pass

# numpy_array = pdExcel_tr.to_numpy()
# np.savetxt("Exc1.txt", numpy_array, fmt = "%s")
pdExcel_tr.to_csv(r'D:\EDocuments\10th Semester\01-Shabake\TA\HW1\Exc1.txt', header=None, index=None, sep=',', mode='a')
print('DataFrame is written successfully to text Sheet.')