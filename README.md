# 📚 Multilingual LLM Chatbot (English / Japanese / Romaji)

The LLM Chatbot example demonstrates how an **ICP smart contract** can be used to interact with a **Large Language Model (LLM)** to generate multilingual text.  
The user can input a **prompt** or **chat messages**, and the smart contract will use the LLM to generate responses in **three languages**:

1. **English (Original)**
2. **Japanese (with Kanji/Kana)**
3. **Romaji (Japanese pronunciation in Latin letters)**

---

## ✨ Features

- ✅ Prompt-based response generation
- ✅ Chat-based conversation
- ✅ Outputs in **English → Japanese (Kanji/Kana) → Romaji**
- ✅ Written in **Motoko**
- ✅ Powered by **Llama3 8B LLM**

---

## 📥 Example Output

```text
Input:
What is the capital of Japan?

Output:
The capital of Japan is Tokyo.

日本の首都は東京です。

Nihon no shuto wa Tōkyō desu.
```

## Deploying from ICP Ninja

When viewing this project in ICP Ninja, you can deploy it directly to the mainnet for free by clicking "Run" in the upper right corner. Open this project in ICP Ninja:

[![](https://icp.ninja/assets/open.svg)](https://icp.ninja/i?g=https://github.com/Bintangps01/LLM-Chatbot)

## Build and deploy from the command-line

### 1. [Download and install the IC SDK.](https://internetcomputer.org/docs/building-apps/getting-started/install)

### 2. Setting up Ollama

To be able to test the agent locally, you'll need a server for processing the agent's prompts. For that, we'll use `ollama`, which is a tool that can download and serve LLMs.
See the documentation on the [Ollama website](https://ollama.com/) to install it. Once it's installed, run:

```
ollama serve
# Expected to start listening on port 11434
```

The above command will start the Ollama server, so that it can process requests by the agent. Additionally, and in a separate window, run the following command to download the LLM that will be used by the agent:

```
ollama run llama3.1:8b
```

The above command will download an 8B parameter model, which is around 4GiB. Once the command executes and the model is loaded, you can terminate it. You won't need to do this step again.

### 3. Download your project from ICP Ninja using the 'Download files' button on the upper left corner, or [clone the GitHub examples repository.](https://github.com/dfinity/examples/)

### 4. Navigate into the project's directory.

### 5. Deploy the project to your local environment:

```
dfx start --background --clean && dfx deploy
```

## Security considerations and best practices

If you base your application on this example, it is recommended that you familiarize yourself with and adhere to the [security best practices](https://internetcomputer.org/docs/building-apps/security/overview) for developing on ICP. This example may not implement all the best practices.
