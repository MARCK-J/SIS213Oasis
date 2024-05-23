<template>
  <div class="chat-container" :class="{ open: isOpen }">
    <div class="chat-header" @click="toggleChat">
      <h2>Asistente</h2>
      <span>{{ isOpen ? '–' : '+' }}</span>
    </div>
    <div class="chat-body" v-if="isOpen">
      <div class="messages">
        <div v-for="message in messages" :key="message.id" :class="['message', message.sender]">
          <p>{{ message.text }}</p>
        </div>
      </div>
      <div class="chat-input">
        <input v-model="inputText" placeholder="Escribe tu mensaje..." @keyup.enter="sendMessage" />
        <button @click="sendMessage">Enviar</button>
      </div>
    </div>
  </div>
</template>

<script>
import { generateResponse } from '../generativeAI';

export default {
  data() {
    return {
      isOpen: false,
      inputText: '',
      messages: [],
    };
  },
  methods: {
    toggleChat() {
      this.isOpen = !this.isOpen;
    },
    async sendMessage() {
      if (this.inputText.trim() === '') return;
      const userMessage = {
        id: Date.now(),
        text: this.inputText,
        sender: 'user',
      };
      this.messages.push(userMessage);
      this.inputText = '';

      try {
        const responseText = await generateResponse(userMessage.text);
        const botMessage = {
          id: Date.now() + 1,
          text: responseText,
          sender: 'bot',
        };
        this.messages.push(botMessage);
      } catch (error) {
        console.error('Error al obtener la respuesta:', error);
      }
    },
  },
};
</script>

<style scoped>
.chat-container {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 300px;
  max-height: 400px;
  background-color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  overflow: hidden;
  transition: max-height 0.3s ease;
}
.chat-container.open {
  max-height: 100%;
}
.chat-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
}
.chat-body {
  padding: 10px;
}
.messages {
  max-height: 300px;
  overflow-y: auto;
  margin-bottom: 10px;
}
.message {
  margin-bottom: 10px;
}
.message.user {
  text-align: right;
}
.message.bot {
  text-align: left;
}
.chat-input {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.chat-input input {
  flex: 1;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-right: 10px;
}
.chat-input button {
  padding: 8px 16px;
  border: none;
  background-color: #007bff;
  color: #fff;
  border-radius: 4px;
  cursor: pointer;
}
</style>
