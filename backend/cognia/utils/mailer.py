import json 
import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


from cognia.settings import BASE_DIR
import os


CREDS_PATH = os.path.join(BASE_DIR, 'CREDS.json')

class Mailer:
    sender_name = None
    sender_email = None
    sender_password = None
    server = None

    def __init__(self):
        with open(CREDS_PATH, 'r') as f:
            creds = json.load(f)
            self.sender_name  = creds['SENDER_NAME']
            self.sender_email  = creds['SENDER_EMAIL']
            self.sender_password  = creds['SENDER_PASSWORD']

        self.server = smtplib.SMTP('smtp.gmail.com', 587)  # or your smtp server
        self.server.ehlo()
        self.server.starttls()
        self.server.login(self.sender_email, self.sender_password)


    def send_email(self, to, subject,  body, cc=None, bcc=None,):

        # convert TO into list if string
        if type(to) is not list:
            to = to.split()

        to_list = to  # remove null emails

        msg = MIMEMultipart('alternative')
        msg['From'] = self.sender_name +' <'+self.sender_email+'>'
        msg['Subject'] = subject
        msg['To'] = ','.join(to)
        msg['Cc'] = cc
        msg['Bcc'] = bcc

        msg.attach(MIMEText(body, 'html'))

        try:
            self.server.sendmail(self.sender_email, to_list, msg.as_string())
            print('sending email to', to_list)
            return 'ok'
        except Exception as e:
            print('Error sending email')
            print(str(e))
            return 'fail'
