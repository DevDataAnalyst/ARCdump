import pandas as pd
from pandas import DataFrame
import json
from json import loads

df_employee = pd.read_table('C:/Personal/My Projects/ARC/ASSIGNMENTS/pyspark1/datasets/employee.dat', sep='|')
df_skill = pd.read_table('C:/Personal/My Projects/ARC/ASSIGNMENTS/pyspark1/datasets/skillset.dat', sep='|')

result = df_skill.merge(df_employee[['emp_id',  'emp_name', 'department']],how='left').fillna("")

df = result
j = (df.groupby(['emp_id','emp_name','department'], as_index=True)
       .apply(lambda x: x[['skillset','experience']].to_dict('r'))
       .reset_index()
       .rename(columns={0:'skills'})
       .to_json(orient='records'))


print(j)