import Meditation from "../../domain/entities/meditation.js";
import UseCaseInterFace from "../interfaces/use_case_interface.js";

class GetAdviceByMood extends UseCaseInterFace {
  constructor(adviceRepository) {
    super();
    this.adviceRepository = adviceRepository;
  }

  async execute(mood) {
    const adviceData = await this.adviceRepository.getAdviceByMood(mood);
    return new Meditation(adviceData);
  }
}

export default GetAdviceByMood;
