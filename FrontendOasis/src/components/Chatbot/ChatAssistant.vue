<template>
  <div>
    <div v-if="showChat" class="chat-container">
      <div class="chat-header">
        <h6>Chat Assistant</h6>
        <span style="cursor: pointer;" @click="toggleChat">
          {{ showChat ? '–' : '+' }}
        </span>
      </div>
      <div class="chat-messages">
        <div v-for="(message, index) in chatMessages" :key="index" class="message-container">
          <div v-if="message.sender === 'User'" class="user-message-container">
            <div class="user-message">{{ message.text }}</div>
          </div>
          <div v-else class="bot-message-container">
            <div class="bot-message">{{ message.text }}</div>
          </div>
        </div>
      </div>
      <div class="chat-input">
        <input v-model="inputMessage" @keyup.enter="sendMessage" placeholder="Escribe tu mensaje...">
        <button @click="sendMessage" class="send-button">
          <span>📤</span>
        </button>
      </div>
    </div>
    <div v-else class="chat-button-container">
      <button @click="toggleChat" class="chat-button">Abrir Chat</button>
    </div>
  </div>
</template>
<script>
import { GoogleGenerativeAI, HarmCategory, HarmBlockThreshold } from '@google/generative-ai';

const apiKey = 'AIzaSyBUsub9sFFCPNi6_ktk3iVZG4gYmXfUvng';
const genAI = new GoogleGenerativeAI(apiKey);

export default {
  data() {
    return {
      showChat: false, // Estado inicial del chat
      chatMessages: [],
      inputMessage: "",
      chatSession: null
    };
  },
  methods: {
    async initChat() {
      const model = genAI.getGenerativeModel({
        model: "gemini-1.5-pro-latest",
        systemInstruction: "Eres un experto en python y tu primer mensaje es dar la bienvenida al usuario, su nombre es Max",
      });

      const generationConfig = {
        temperature: 1,
        topP: 0.95,
        topK: 64,
        maxOutputTokens: 8192,
        responseMimeType: "text/plain",
      };

      const safetySettings = [
        {
          category: HarmCategory.HARM_CATEGORY_HARASSMENT,
          threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
        },
        {
          category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
          threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
        },
        {
          category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
          threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
        },
        {
          category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
          threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
        },
      ];

      this.chatSession = model.startChat({
        generationConfig,
        safetySettings,
        history: [],
      });

      const result = await this.chatSession.sendMessage("INSERT_INPUT_HERE");
      const initialMessage = result.response.text();

      this.addMessage("Gemini Bot", initialMessage);
    },
    async toggleChat() {
      this.showChat = !this.showChat;
      if (this.showChat && !this.chatSession) {
        this.initChat();
      }
    },
    async sendMessage() {
      const userMessage = this.inputMessage.trim();
      if (userMessage === "") return;

      this.addMessage("User", userMessage);

      const botResponse = await this.getBotResponse(userMessage);

      this.addMessage("Gemini Bot", botResponse);

      this.inputMessage = "";
    },
    async getBotResponse(userMessage) {
      const result = await this.chatSession.sendMessage(userMessage);
      return result.response.text();
    },
    addMessage(sender, text) {
      this.chatMessages.push({sender, text});
    }
  },
};
</script>

<style scoped>
.chat-container {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 500px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 10px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.chat-header {
  background-color: #007bff;
  color: white;
  padding: 10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  display: flex;
  justify-content: space-between;
}

.chat-messages {
  height: 400px;
  overflow-y: auto;
  padding: 10px;

}

.message-container {
  margin-bottom: 10px;
}

.user-message {
  background-color: #007bff;
  color: white;
  padding: 10px;
  border-radius: 10px;
  max-width: 70%;
  align-self: flex-end;
}

.bot-message {
  background-color: #f0f0f0;
  color: #333;
  padding: 10px;
  border-radius: 10px;
  max-width: 70%;
}

.chat-input {
  display: flex;
  align-items: center;
  padding: 10px;
  background-color: #f9f9f9;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

.chat-input input {
  flex: 1;
  margin-right: 10px;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 5px;
  outline: none;
}

.chat-input button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 8px;
  border-radius: 50%; /* Hace que el botón sea un círculo */
  cursor: pointer;
}

.chat-button-container {
  position: fixed;
  bottom: 20px;
  right: 20px;
}

.chat-button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}
.user-message-container {
  display: flex;
  justify-content: flex-end; /* Alinea a la derecha */
  margin-bottom: 10px;
}

.user-message {
  background-color: #007bff;
  color: white;
  padding: 10px;
  border-radius: 10px;
  max-width: 70%;
}

/* Estilos para los mensajes del bot */
.bot-message-container {
  display: flex;
  justify-content: flex-start; /* Alinea a la izquierda */
  margin-bottom: 10px;
}

.bot-message {
  background-color: #f0f0f0;
  color: #333;
  padding: 10px;
  border-radius: 10px;
  max-width: 70%;
}
</style>
