import requests

result_switch = {
    200: "OK",
    404: "NOT FOUND",
}

result = requests.get("https://example.com/")
status_code = result.status_code

status = result_switch.get(status_code)

if status != None:
    print(status)
else:
    print("UH OHH")
