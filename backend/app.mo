import LLM "mo:llm";

persistent actor {
  // Fungsi untuk menghasilkan respons dalam bahasa Inggris, Jepang (dengan Furigana), dan Romaji
  public func prompt(prompt : Text) : async Text {
    // 1. Dapatkan respons awal dari LLM
    let initial_response = await LLM.prompt(#Llama3_1_8B, prompt);

    // 2. Terjemahkan respons awal ke dalam bahasa Jepang
    let japanese_translation_prompt = "Translate the following text to Japanese: " # initial_response;
    let japanese_response = await LLM.prompt(#Llama3_1_8B, japanese_translation_prompt);

    // 3. Ubah teks bahasa Jepang menjadi Romaji
    let romaji_conversion_prompt = "Convert the following Japanese text to Romaji: " # japanese_response;
    let romaji_response = await LLM.prompt(#Llama3_1_8B, romaji_conversion_prompt);

    // 4. Gabungkan semua respons menjadi satu teks
    return initial_response # "\n\n" # japanese_response # "\n" # romaji_response;
  };

  // Fungsi untuk melakukan chat dan memberikan respons dalam bahasa Inggris, Jepang (dengan Furigana), dan Romaji
  public func chat(messages : [LLM.ChatMessage]) : async Text {
    // 1. Dapatkan respons chat awal dari LLM
    let response = await LLM.chat(#Llama3_1_8B).withMessages(messages).send();

    let initial_response = switch (response.message.content) {
      case (?text) text;
      case null "";
    };

    // 2. Terjemahkan respons awal ke dalam bahasa Jepang
    let japanese_translation_prompt = "Translate the following text to Japanese: " # initial_response;
    let japanese_response = await LLM.prompt(#Llama3_1_8B, japanese_translation_prompt);

    // 3. Ubah teks bahasa Jepang menjadi Romaji
    let romaji_conversion_prompt = "Convert the following Japanese text to Romaji: " # japanese_response;
    let romaji_response = await LLM.prompt(#Llama3_1_8B, romaji_conversion_prompt);

    // 4. Gabungkan semua respons menjadi satu teks
    return initial_response # "\n\n" # japanese_response # "\n\n" # romaji_response;
  };
};