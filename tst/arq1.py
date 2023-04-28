import configparser

parser = configparser.ConfigParser()
parser.read('arq.conf')
print(parser.get("config", "option1"))
print(parser.get("config", "option2"))
print(parser.get("config", "option3"))
