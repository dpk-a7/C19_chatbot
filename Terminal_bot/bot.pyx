import numpy as np
from catboost import CatBoostClassifier
import time



def CatBoost(X):
        classifier = CatBoostClassifier()
        classifier.load_model('Cat_ready',format = 'cbm')
        return classifier.predict(X)[0]

def startbot():
    question_set = {
        '1': 'What is your age?',
        '2': 'What is your body temprature in fahrenheit?',
        '3': 'Have you visited any place recently? (y / n)',
        '4': 'Do you often cough? (y / n)',
        '5': 'Do you have Phlegm? (y / n)',
        '6': 'Do you feel chillness? (y / n)',
        '7': 'Do you feel pressure in chest? (y / n)',
        '8': 'Do you have Runny or stuff nose? (y / n)',
        '9': 'Do you feel fatigue? (y / n)',
        '10':'Do you have sore throat? (y / n)',
        '11':'Do you feel difficulty while breathing? (y / n)',
        '12':'Do you feel tasteless when having your meal? (y / n)',
        '13':'Do you have smell problem? (y / n)',
        '14':'Do feel difficulty in speaking? (y / n)'
        }
    
    def anime():
        animation = "|/-\|"
        idx = 0
        i = 0
        while (i<45):
            print(animation[idx % len(animation)], end="\r")
            idx += 1
            time.sleep(0.1)
            i+=1
            
    main_list = []
    main_list1 = []
    
    
    
    for i in range(1,15):
        print(question_set['{}'.format(i)])
        ans = input()
        main_list.append(ans)
    
    for j in main_list:
        if j == 'y':
            j = 1
        if j == 'n':
            j = 0
        main_list1.append(j)
        
    #[1]corona, [2]cold, [3]fever, [4]flu
    anime()
    answer = CatBoost(main_list1)
    #time.sleep()
    if answer == 1:
        print("Our model predicted that you have COVID-19!")
    elif answer == 2:
        print("Our model predicted that you have Cold!")
    elif answer == 3:
        print("Our model predicted that you have Fever!")
    elif answer  == 4:
        print("Our model predicted that you have Flu!")
    else:
        print("Our model predicted that you are Normal!")
        
if __name__ == '__main__':
    startbot()
    
