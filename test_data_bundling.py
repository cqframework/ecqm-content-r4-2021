import os, json
import pandas as pd

path_to_json = './bundles/sampledata/CMS125v10 Sample Data/sampleData'

sample_path = os.path.join('./input/tests','BreastCancerScreeningsFHIR')
if not os.path.isdir(sample_path):
    os.mkdir(sample_path)
for pos_json in os.listdir(path_to_json):
    with open('./bundles/sampledata/CMS125v10 Sample Data/sampleData/'+pos_json, encoding='utf-8') as json_data:
        expectation_json = json.load(json_data)
        if 'entry' in expectation_json:
            for element in expectation_json['entry']:
                if element['resource']['resourceType'] == "Patient":
                    path = os.path.join('./input/tests/BreastCancerScreeningsFHIR',element['resource']['id'])
                    if not os.path.isdir(path):
                        os.mkdir(path)
                resource_path = os.path.join(path+'/',element['resource']['resourceType'])
                if not os.path.isdir(resource_path):
                    os.mkdir(resource_path)
                json_path = os.path.join(resource_path, element['resource']['id']+'.json')
                if not os.path.isfile(json_path):
                    with open(json_path, 'w') as f:
                        json.dump(element['resource'], f, indent=2)
