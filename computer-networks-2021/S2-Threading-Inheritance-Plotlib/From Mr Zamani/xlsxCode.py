import xlsxwriter
import os
import pandas as pd

workbook = xlsxwriter.Workbook(os.path.join(os.getcwd(), 'test.xlsx'))
worksheet = workbook.add_worksheet("Python")

items = (
    ['405', 300],
    ['dena', 450],
    ['206', 370]
)

row = col = 0
for carName, price in items:
    worksheet.write(row, col, carName)
    worksheet.write(row, col+1, price)
    row += 1

form = workbook.add_format({'bold': True})
form.set_font_color('red')
form.set_font("Times New Roman")
form.set_font_size(10)
workbook.add_format

worksheet.write(row, col, 'sum', form)
worksheet.write(row, 1, '=sum(B1:B3)')

workbook.close()

#-----------------------------------------------
pdExcel = pd.read_excel('test.xlsx')

print(pdExcel)