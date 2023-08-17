import openai

# Configure your OpenAI API key
openai.api_key = 'YOUR_OPENAI_API_KEY'

@app.route('/get-response', methods=['POST'])
def get_response():
    data = request.json
    user_message = data['message']

    # Integrate with OpenAI API to get a response using user_message
    response = openai.Completion.create(
        engine="gpt-3.5-turbo",
        prompt=user_message,
        max_tokens=50
    )
    bot_response = response.choices[0].text.strip()

    return jsonify({'response': bot_response})
