//= require rails-ujs
//= require_tree .

// Confirmación de carga de Rails UJS
import Rails from "@rails/ujs";
Rails.start();

// Importa Turbo y otros controladores
import "@hotwired/turbo-rails";
import "controllers";

// Código personalizado
document.addEventListener("DOMContentLoaded", () => {
  console.log("Document loaded");

  const deleteButtons = document.querySelectorAll('[data-method="delete"]');
  deleteButtons.forEach(button => {
    button.addEventListener("click", (event) => {
      if (!confirm("¿Estás seguro de que deseas eliminar este post?")) {
        event.preventDefault();
      }
    });
  });
});


