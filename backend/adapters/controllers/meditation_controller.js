import GeminiService from "../../infrastructure/gemini/gemini_service.js";
import GetDailyQuotes from "../../application/use-cases/get_daily_quotes.js";
import GetAdviceByMood from "../../application/use-cases/get_advice_by_mood.js";

class MeditationController {
    static async dailyQuote(req, res) {
        try {
            // call gemini service
            const quotesRepository = new GeminiService();
            // get the quote
            const getDailyQuote = new GetDailyQuotes(quotesRepository);
            const quotes = await getDailyQuote.execute();
            // give me the quotes as json
            res.json(quotes);
        } catch (error) {
            // give me the error but as json response as json
            res.status(500).json({ error: error.message });
        }
    }

    // like [dailyQuote] function
    static async myMood(req, res) {
        try {
            const { mood } = req.params;
            // call gemini service
            const quotesRepository = new GeminiService();
            // get the advice
            const getAdviceByMood = new GetAdviceByMood(quotesRepository);
            const advice = await getAdviceByMood.execute(mood);
            // give me the quotes as json
            res.json(advice);
        } catch (error) {
            // give me the error but as json response as json
            res.status(500).json({ error: error.message });
        }
    }
}

export default MeditationController;
