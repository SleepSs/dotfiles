import sys
import os
import requests
import json

def main():
    input_lines = []
    while True:
        try:
            line = input()
            input_lines.append(line)
        except EOFError:
            break  # Exit the loop if EOF signal is detected
    user_input = "\n".join(input_lines)
    
    try:

        url = "https://api.deepseek.com/chat/completions"

        payload = json.dumps({
          "messages": [
            {
              "content": "You are a helpful assistant",
              "role": "system"
            },
            {
              "content": f"{user_input}",
              "role": "user"
            }
          ],
          "model": "deepseek-coder",
          "frequency_penalty": 0,
          "max_tokens": 2048,
          "presence_penalty": 0,
          "stop": None,
          "stream": True,
          "temperature": 0,
          "top_p": 1,
          "logprobs": False,
          "top_logprobs": None
        })
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': f"Bearer {os.getenv('deepseek_key')}"
        }

        response = requests.request("POST", url, headers=headers, data=payload, stream=True)

        for line in response.iter_lines():
            if line:
                # Decode each line to a string and remove the 'data:' prefix
                decoded_line = line.decode('utf-8').replace('data: ', '')
                
                if decoded_line == "[DONE]":
                    continue

                # Convert the JSON string to a dictionary
                data = json.loads(decoded_line)

                # Extracting content from the choices array
                for choice in data.get('choices', []):
                    content = choice.get('delta', {}).get('content')
                    if content:
                        print(content, end='', flush=True)

    except Exception as e:
        print("An error occurred:", e)
        sys.exit(1)

if __name__ == "__main__":
    main()

