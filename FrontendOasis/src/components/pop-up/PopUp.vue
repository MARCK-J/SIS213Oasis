<script>
export default {
    methods: {
        close(){
            this.$emit('close')
        }
    },
}
</script>
<template>
  <div class="pop-up">
    <div class="pop-up-inner">
      <div class="pop-up-close" @click=close()>&times;</div>
      <h1>Explora tu destino!</h1>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis a
        iste ducimus necessitatibus similique, dolore modi possimus maxime
        adipisci, laboriosam ratione nam alias praesentium, eius facilis
        commodi. Corporis, nisi dolor?
      </p>
      <button @click=close()>Cerrar</button>
    </div>
  </div>
</template>
<style>
.pop-up {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 10;
  padding: 32px 16px 120px;
  height: 100vh;
  width: 100%;
  background-color: rgba(144, 216, 214, 0.5);
  display: grid;
  place-items: center;
}
.pop-up-close {
  position: absolute;
  height: 52px;
  width: 52px;
  display: flex;
  justify-content: center;
  align-items: center;
  top: 0;
  right: 0;
  font-size: 3rem;
  color: black;
  cursor: pointer;
}
.pop-up-inner {
    /* background del popup */
  background-color: #fff;
  color: #000;
  position: relative;
  width: 70%;
  padding: 40px;
  border-radius: 8px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.2);
  transition: all 250ms ease-in-out;
}
.fade-enter,
.fade-leave-to{
    opacity: 0;
    .pop-up-inner{
        opacity: 0;
        transform: translateY(-32px);
    }
}
.fade-enter-active,
.fade-leave-active{
    transition: all 250ms ease-in-out;
}
.fade-leave-active{
    transition-delay: 250ms;
}
</style>
