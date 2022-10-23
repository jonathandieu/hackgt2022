# importing the libraries
from bs4 import BeautifulSoup
import requests

url="https://www.nerdwallet.com/article/credit-cards/current-credit-card-bonus-categories"

# Make a GET request to fetch the raw HTML content
html_content = requests.get(url).text

# Parse the html content
soup = BeautifulSoup(html_content, "html")

res = soup.find(class_="_2GMChG._3-to_p")
print(res) # print the parsed data of html