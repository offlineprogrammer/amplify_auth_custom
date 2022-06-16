function verifyAuthChallengeResponse(event) {
  if (event.request.privateChallengeParameters.answer === event.request.challengeAnswer) {
      event.response.answerCorrect = true;
  } else {
      event.response.answerCorrect = false;
  }
}

exports.handler = async (event) => {
  verifyAuthChallengeResponse(event);
}