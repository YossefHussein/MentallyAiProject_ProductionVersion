// import packages
const dotenv = require('dotenv')
// make config of dotenv
dotenv.config()
// import the gemini package
const { GoogleGenAI } = require('@google/genai')
// import the interface
const QuotesRepository = require('../../application/interfaces/quotes_repository')
// adding the api key to gemini
const genAi = new GoogleGenAI({ apiKey: process.env.Gemini_API_KEY })
class GeminiService extends QuotesRepository {
  // we use this function in controller to get quotes or advices from gemini
  // get the advice by gemini
  async getAdviceByMood(mood) {
    // the prompt with mood
    const prompt = `give the current mood of the user, provide an appropriate meditation advice or mental health exercise
                     So the mood is ${mood}: 
                           {
                            "advice": "specific advice or exercises based on the user"s mood",
                            }
                            return the json only without using keyword json and \`\`\`json  {"advice" : " content"}\`\`\` just return raw advice`
    // the 
    const response = await genAi.models.generateContent({
      model: 'gemini-2.0-flash',
      contents: prompt,
    })
    // // return the advice as text
    const result = await response.text
    return result
  }

  // it's like the [getAdviceByMood] but without mood
  // get the advice by gemini
  async getDailyQuotes() {
    const prompt = `Please provide three inspirational quotes for meditation, one for each part of the day: morning, noon, and evening. Respond in JSON format with follow:
                        {
                        "morningQuote": "Your morning quote here",
                        "noonQuote": "Your noon quote here",
                        "eveningQuote": "Your evening quote here"
                        } 
                        return the json only without using keyword json and \`\`\`json`
    const result = await model.generateContent(prompt)
    const response = await result.response
    return response.text()
  }
}

module.exports = GeminiService
