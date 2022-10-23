from cgitb import text
import string
from bs4 import BeautifulSoup
import requests

url="https://creditcards.chase.com/cash-back-credit-cards"


html_content = requests.get(url).text


soup = BeautifulSoup(html_content, "html.parser")
print(soup.findAll("strong", "bold-alt")) 

#thing i wanted to use but couldn't get to print anything below
#print(soup.findAll("strong", string="bonus"))