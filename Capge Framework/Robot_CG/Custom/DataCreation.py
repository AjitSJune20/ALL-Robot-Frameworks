import pandas as pd
import re
import xlsxwriter
import win32com.client as win32
import os
import sys
import fileinput
import xlrd
import pyexcel



def create_data_excel(filepath):
    df1 = pd.read_excel(filepath + "\\TestData.xlsx", "KY Medicaid Assessment", keep_default_na=False, dtype='object')
    df2 = pd.read_excel(filepath + "\\TestData.xlsx", "KYTaskValidate", keep_default_na=False, dtype='object')
    df3 = pd.read_excel(filepath + "\\TestData.xlsx", "CarePlan2_0", keep_default_na=False, dtype='object')
    df4 = pd.read_excel(filepath + "\\TestData.xlsx", "IP_Auth_Creation", keep_default_na=False, dtype='object')
    df5 = pd.read_excel(filepath + "\\TestData.xlsx", "FL_PR_Assessment", keep_default_na=False, dtype='object')
    df6 = pd.read_excel(filepath + "\\TestData.xlsx", "SC_E2E_Communication_Record", keep_default_na=False, dtype='object')
    df7 = pd.read_excel(filepath + "\\TestData.xlsx", "BHIPAuth_KYMCDReferral", keep_default_na=False, dtype='object')
    df8 = pd.read_excel(filepath + "\\TestData.xlsx", "IL_Assessment", keep_default_na=False)
    df9 = pd.read_excel(filepath + "\\TestData.xlsx", "IL_Assessment_HCBS", keep_default_na=False)
    #df10 = pd.read_excel(filepath + "\\TestData.xlsx", "KY_HealthRiskAssessment", keep_default_na=False)
    df11 = pd.read_excel(filepath + "\\TestData.xlsx", "IL_Assessment_LTC", keep_default_na=False)
    df12 = pd.read_excel(filepath + "\\TestData.xlsx", "FL_HealthRiskAssessment", keep_default_na=False)
    df13 = pd.read_excel(filepath + "\\TestData.xlsx", "Fragile_Pediatric_Rule_OP_Auth", keep_default_na=False)
    df14 = pd.read_excel(filepath + "\\TestData.xlsx", "TaskGenerate_on_FU_IPAuth_TC01", keep_default_na=False)
    df15 = pd.read_excel(filepath + "\\TestData.xlsx", "ReferalRequest", keep_default_na=False)
    # df15 = pd.read_excel(filepath + "\\TestData.xlsx", "TC05_Sc_EndToEnd", keep_default_na=False)
    df16 = pd.read_excel(filepath + "\\TestData.xlsx", "Smoke", keep_default_na=False)
    df18 = pd.read_excel(filepath + "\\TestData.xlsx", "OP_Auth_Creation", keep_default_na=False)
    # df16 = pd.read_excel(filepath + "\\TestData.xlsx", "Pritegrity", keep_default_na=False)
    df17 = pd.read_excel(filepath + "\\TestData.xlsx", "CreateAuthInAvility", keep_default_na=False)
    df19 = pd.read_excel(filepath + "\\TestData.xlsx", "TC01_FL_End to End Regression", keep_default_na=False)
    df20 = pd.read_excel(filepath + "\\TestData.xlsx", "TC02_FL_End to End Regression", keep_default_na=False)
    df21 = pd.read_excel(filepath + "\\TestData.xlsx", "TC02_FL_End to End RegrPart_2", keep_default_na=False)
    df22 = pd.read_excel(filepath + "\\TestData.xlsx", "FL_NF_Assessment", keep_default_na=False)
    # df22 = pd.read_excel(filepath + "\\TestData.xlsx", "CreateBHOPAuthInAvality", keep_default_na=False)
    df23 = pd.read_excel(filepath + "\\TestData.xlsx", "TC01_FL_ET", keep_default_na=False)
    df24 = pd.read_excel(filepath + "\\TestData.xlsx", "TC04_FL_ET", keep_default_na=False)
    df25 = pd.read_excel(filepath + "\\TestData.xlsx", "FL_ALF_Assessment", keep_default_na=False)
    df26 = pd.read_excel(filepath + "\\TestData.xlsx", "TC12_Genetic", keep_default_na=False)
    df27 = pd.read_excel(filepath + "\\TestData.xlsx", "MedicaidID_And_AddressScenerio", keep_default_na=False)
    df28 = pd.read_excel(filepath + "\\TestData.xlsx", "VariousFlows", keep_default_na=False)
    df29 = pd.read_excel(filepath + "\\TestData.xlsx", "Task", keep_default_na=False)
    df30 = pd.read_excel(filepath + "\\TestData.xlsx", "ServiceCart", keep_default_na=False)
    df31 = pd.read_excel(filepath + "\\TestData.xlsx", "Assessments", keep_default_na=False)
    df32 = pd.read_excel(filepath + "\\TestData.xlsx", "LTSS_Auth_Creation_VariousFlow", keep_default_na=False)


    df1.set_index("TestCaseId", drop=True, inplace=True)
    df2.set_index("TestCaseId", drop=True, inplace=True)
    df3.set_index("TestCaseId", drop=True, inplace=True)
    df4.set_index("TestCaseId", drop=True, inplace=True)
    df5.set_index("TestCaseId", drop=True, inplace=True)
    df6.set_index("TestCaseId", drop=True, inplace=True)
    df7.set_index("TestCaseId", drop=True, inplace=True)
    df8.set_index("TestCaseId", drop=True, inplace=True)
    df9.set_index("TestCaseId", drop=True, inplace=True)
    # df10.set_index("TestCaseId", drop=True, inplace=True)
    df11.set_index("TestCaseId", drop=True, inplace=True)
    df12.set_index("TestCaseId", drop=True, inplace=True)
    df13.set_index("TestCaseId", drop=True, inplace=True)
    df14.set_index("TestCaseId", drop=True, inplace=True)
    df15.set_index("TestCaseId", drop=True, inplace=True)
    df16.set_index("TestCaseId", drop=True, inplace=True)
    df17.set_index("TestCaseId", drop=True, inplace=True)
    df18.set_index("TestCaseId", drop=True, inplace=True)
    df19.set_index("TestCaseId", drop=True, inplace=True)
    df20.set_index("TestCaseId", drop=True, inplace=True)
    df21.set_index("TestCaseId", drop=True, inplace=True)
    df22.set_index("TestCaseId", drop=True, inplace=True)
    df23.set_index("TestCaseId", drop=True, inplace=True)
    df24.set_index("TestCaseId", drop=True, inplace=True)
    df25.set_index("TestCaseId", drop=True, inplace=True)
    df26.set_index("TestCaseId", drop=True, inplace=True)
    df27.set_index("TestCaseId", drop=True, inplace=True)
    df28.set_index("TestCaseId", drop=True, inplace=True)
    df29.set_index("TestCaseId", drop=True, inplace=True)
    df30.set_index("TestCaseId", drop=True, inplace=True)
    df31.set_index("TestCaseId", drop=True, inplace=True)
    df32.set_index("TestCaseId", drop=True, inplace=True)

    test1 = df1.to_dict(orient="index")
    test2 = df2.to_dict(orient="index")
    test3 = df3.to_dict(orient="index")
    test4 = df4.to_dict(orient="index")
    test5 = df5.to_dict(orient="index")
    test6 = df6.to_dict(orient="index")
    test7 = df7.to_dict(orient="index")
    test8 = df8.to_dict(orient="index")
    test9 = df9.to_dict(orient="index")
    # test10 = df10.to_dict(orient="index")
    test11 = df11.to_dict(orient="index")
    test12 = df12.to_dict(orient="index")
    test13 = df13.to_dict(orient="index")
    test14 = df14.to_dict(orient="index")
    test15 = df15.to_dict(orient="index")
    test16 = df16.to_dict(orient="index")
    test17 = df17.to_dict(orient="index")
    test18 = df18.to_dict(orient="index")
    test19 = df19.to_dict(orient="index")
    test20 = df20.to_dict(orient="index")
    test21 = df21.to_dict(orient="index")
    test22 = df22.to_dict(orient="index")
    test23 = df23.to_dict(orient="index")
    test24 = df24.to_dict(orient="index")
    test25 = df25.to_dict(orient="index")
    test26 = df26.to_dict(orient="index")
    test27 = df27.to_dict(orient="index")
    test28 = df28.to_dict(orient="index")
    test29 = df29.to_dict(orient="index")
    test30 = df30.to_dict(orient="index")
    test31 = df31.to_dict(orient="index")
    test32 = df32.to_dict(orient="index")

    f = open(filepath + "\\TestData.robot", "w")
    print("Saved to file")
    f.write("*** Variables ***\n")
    f.write("\n######## KY Medicaid Assessment ###################\n\n")
    f.write(str(test1))
    f.write("\n  ######## CM Cm Case Data ################### \n\n")
    f.write(str(test2))
    f.write("\n  ######## OP Authorization Creation ################### \n\n")
    f.write(str(test3))
    f.write("\n  ######## IP Authorization Creation  ################### \n\n")
    f.write(str(test4))
    f.write("\n  ######## FL PR Assessment    ##################### \n\n")
    f.write(str(test5))
    f.write("\n  ######## SC_E2E_Communication_Record    ##################### \n\n")
    f.write(str(test6))
    f.write("\n  ######## Smoke Data    ##################### \n\n")
    f.write(str(test7))
    f.write("\n  ######## IL_Assessment    ##################### \n\n")
    f.write(str(test8))
    f.write("\n  ######## IL_Assessment HCBS   ##################### \n\n")
    f.write(str(test9))
    # f.write("\n  ######## KY_Assessment Health Risk   ##################### \n\n")
    # f.write(str(test10))
    f.write("\n  ######## IL_Assessment LTC   ##################### \n\n")
    f.write(str(test11))
    f.write("\n  ######## FL_Assessment Health Risk   ##################### \n\n")
    f.write(str(test12))
    f.write("\n  ######## Fragile_Pediatric_Rule_Task   ##################### \n\n")
    f.write(str(test13))
    f.write("\n  ######## TaskGenerate_on_FU_IPAuth_TC01   ##################### \n\n")
    f.write(str(test14))
    f.write("\n  ######## Referal Request   ##################### \n\n")
    f.write(str(test15))
    # f.write("\n  ######## 1571736_CLIN_MF32_BHIP_Auth   ##################### \n\n")
    f.write("\n  ######## Pritegrity   ##################### \n\n")
    f.write(str(test16))
    f.write("\n  ######## CreateAuthInAvility   ##################### \n\n")
    f.write(str(test17))
    f.write("\n  ######## IPAuth_KYMDReferral   ##################### \n\n")
    f.write(str(test18))
    f.write("\n  ######## FL1   ##################### \n\n")
    f.write(str(test19))
    f.write("\n  ######## FL2   ##################### \n\n")
    f.write(str(test20))
    f.write("\n  ######## FL3   ##################### \n\n")
    f.write(str(test21))
    f.write("\n  ######## FL4   ##################### \n\n")
    f.write(str(test22))
    f.write("\n  ######## FL_ET_01   ##################### \n\n")
    f.write(str(test23))
    f.write("\n  ######## FL_ET_04   ##################### \n\n")
    f.write(str(test24))
    f.write("\n  ######## FL ALF Assessment   ##################### \n\n")
    f.write(str(test25))
    f.write("\n ############ TC12_Genetic ################## \n\n")
    f.write(str(test26))
    f.write("\n ############ MedicaidID_And_AddressScenerio ################## \n\n")
    f.write(str(test27))
    f.write("\n ############ Various Flows ################## \n\n")
    f.write(str(test28))
    f.write("\n ############ Task ################## \n\n")
    f.write(str(test29))
    f.write("\n ############ Service Cart ################## \n\n")
    f.write(str(test30))
    f.write("\n ############ Assessments ################## \n\n")
    f.write(str(test31))
    f.write("\n ############ LTSS_Auth_Creation_VariousFlow ################## \n\n")
    f.write(str(test32))
    f.close()


def format_data(filepath):
    fin = open(filepath + "\\TestData.robot", "rt")
    data = fin.read()
    data = re.sub("},", "\n", data)
    data = re.sub("}}", "\n", data)
    data = re.sub("{'", "", data)
    data = re.sub("':", "=", data)
    data = re.sub("}=", "} ", data)
    data = re.sub("= '", "=", data)
    data = re.sub("', '", "   ", data)
    data = re.sub(" '&", "&", data)
    data = re.sub("'\n", "\n", data)
    data = re.sub(", '", "  ", data)
    data = re.sub("= ", "=", data)
    data = re.sub('"', "", data)
    fin.close()
    fin = open(filepath + "\\TestData.robot", "wt")
    fin.write(data)
    fin.close()


def create_a_txt_file(filepath):
    file = open(filepath + "\\OutputData.txt", "w+")


def write_to_file(filepath,header_key, header_values):
    file = open(filepath + "\\OutputData.txt", "r+")
    content = file.read()
    content_length = len(content)
    print(content_length)
    if content_length == 0:
        file.write(str(header_key) + "\n")
        file.write(str(header_values) + "\n")
    else:
        file.write(str(header_values) + "\n")
    file.close()


def format_output_data(filepath):
    file = open(filepath + "\\OutputData.txt", "r+")
    data = file.read()
    data = re.sub("[\[]", "",data)
    data = re.sub("]", "", data)
    data = re.sub("'", "", data)
    file.close()
    file = open(filepath + "\\OutputData.txt", "wt")
    file.write(data)
    file.close()


def write_to_excel(filepath,sheet_name, index):
    df = pd.read_table(filepath + "\\OutputData.txt", sep=',')
    df.set_index(index, drop=True, inplace=True)
    df.to_excel(filepath + "\\output.xlsx", sheet_name)


def remove_whitespace(instring):
    return instring.strip


def format_excel(filepath,sheet_name):
    workbook = xlsxwriter.Workbook(filepath + "\\output.xlsx")
    worksheet = workbook.add_worksheet(sheet_name)
    worksheet.add_table('A1:F5',{'style' : 'Table Style Light 17'})


def  sort_Assc(List_sort):
    new_List = sorted(List_sort)
    print(type(new_List))
    return new_List

def  ConvertList_to_Upper(List_sort):
    for i in range(len(List_sort)):
        List_sort[i]= List_sort[i].upper()
    print(type(List_sort))
    return List_sort

def convert_xls_to_xlsx():
    fname = "\\\\LOUISILON02S\\USERDAT01\\AHS8367\\Downloads\\Reports.xls"
    excel = win32.gencache.EnsureDispatch('Excel.Application')
    wb = excel.Workbooks.Open(fname)
    wb.SaveAs(fname + "x", FileFormat=51)  # FileFormat = 51 is for .xlsx extension
    wb.Close()  # FileFormat = 56 is for .xls extension
    excel.Application.Quit()

def read_xlsfile(filepath):
    df = pd.read_excel('\\\\LOUISILON02S\\USERDAT01\\AHS8367\\Downloads\\Reports.xlsx', header=None)
    print(df)
    print(df.values[2][2])
    df26 = pd.read_excel(filepath + "\\TestData.xlsx", "TC12_Genetic", header=None)
    print(df26.values[2][11])

    global Total_Rows
    Total_Rows = df.shape[0]
    print(Total_Rows)

    for i in range(1, Total_Rows):
        if df.values[i][2] in df26.values[2][11]:
            # return True
            print(str(df.values[i][2])+"=> Found")
        else:
            return False
            # print(str(df.values[i][2])+" => Not Found")

def add_fax_Detail_into_TestData(Totalcount,Sheetname,ColNameArray,row_num,Parameter):
    wb = openpyxl.load_workbook('C:\\bin\\RobotAutomation1\\Data\\TestData.xlsx')
    sheet = wb.get_sheet_by_name(Sheetname)
    for x in range(Totalcount):
       sheet[ColNameArray[x] + str(row_num)].value = Parameter[x]
    wb.save('C:\\bin\\RobotAutomation1\\Data\\TestData.xlsx')
