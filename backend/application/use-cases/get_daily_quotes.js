import Meditation from "../../domain/entities/meditation.js";
// import the interface
import UseCaseInterFace from "../interfaces/use_case_interface.js";

class GetDailyQuotes extends UseCaseInterFace {
  constructor(quotesRepository) {
    super();
    this.quotesRepository = quotesRepository;
  }

  async execute() {
    // take the quote form api
    const quoteData = await this.quotesRepository.getDailyQuotes();
    // and return the quote to Meditation
    return new Meditation(quoteData);
  }
}

export default GetDailyQuotes;
