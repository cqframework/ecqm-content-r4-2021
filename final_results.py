import os, json
import pandas as pd

"""
Retrieving values from Expectations
"""

path_to_json = './bundles/sampledata/CMS125v10 Sample Data/sampleExpectations'
expectlist = []
for pos_json in os.listdir(path_to_json):
        with open('./bundles/sampledata/CMS125v10 Sample Data/sampleExpectations/'+pos_json, encoding='utf-8') as json_data:
            expectation_json = json.load(json_data)
            ex =   {"id": expectation_json["patientId"],
                    "Initial Population": expectation_json["expectations"]["Initial Population"],
                    "Denominator": expectation_json["expectations"]["Denominator"],
                    "Denominator Exclusions": expectation_json["expectations"]["Denominator Exclusions"],
                    "Numerator": expectation_json["expectations"]["Numerator"]}
            expectlist.append(ex)

"""
Retrieving values from Results
"""

with open('./input/tests/results/BreastCancerScreeningsFHIR.txt',"r") as text:
  lines = text.readlines()
  resultset = []
  while(True):
      a = dict()
      line = lines [:]
      for i in line:
          if "=" in i:
              as_list = i.split("=",1)
              a[as_list[0]]=as_list[1]
          if i == "\n":
              lines.remove(i)
              break
          lines.remove(i)
      resultset.append(a)
      if len(line)<17:
          break

"""
Combining both values from results and expectations into a dataframe
"""
dflist=[]
for i in expectlist:
    for j in resultset:
        aaa = []
        if "Patient" in j.keys():
            x = j["Patient"].split("=",1)
            if str(i["id"]) == str(x[1].replace(")\n","")):
                aaa.append(i["id"])
                a1 = j["Initial Population"].replace("\n","")
                b1 = j["Denominator"].replace("\n","")
                c1 = j["Numerator"].replace("\n","")
                d1 = j["Denominator Exclusions"].replace("\n","")

                a2 = str(i["Initial Population"]).lower()
                b2 = str(i["Denominator"]).lower()
                c2 = str(i["Numerator"]).lower()
                d2 = str(i["Denominator Exclusions"]).lower()

                mydf = pd.DataFrame(columns= ["Initial Population","Denominator","Numerator", "Denominator Exclusions"],
                                    index = ["Results",'Expectation','Final'])
                mydf.iloc[0] = [a1,b1,c1,d1]
                mydf.iloc[1] = [a2,b2,c2,d2]
                a = "Not Met"
                if a1 == a2 : a = "Met"
                b = "Not Met"
                if b1 == b2 : b = "Met"
                c = "Not Met"
                if c1 == c2 : c = "Met"
                d = "Not Met"
                if d1 == d2 : d = "Met"
                mydf.iloc[2] = [a,b,c,d]
                aaa.append(mydf)
                dflist.append(aaa)


"""
Reading the dataframes into the text file
"""

with open("Final_results.txt", 'w') as f:
    f.write("\n\nFinal Results\n\n")
    for i in dflist:
        hh = i[0]
        df = i[1]
        df_as_str = df.to_string(header = True, index = True)
        f.write(hh)
        f.write("\n")
        f.write(df_as_str)
        f.write("\n")
        f.write("=============================================================================\n\n")
