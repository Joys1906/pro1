class Post < ApplicationRecord
  belongs_to :user
  
  # Configuración de Paperclip para manejar la imagen
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, attachment_presence: true # Validación de presencia para Paperclip

  # Validaciones
  validates :description, presence: true, length: { minimum: 10 }
  validate :user_logged_in

  private

  def user_logged_in
    errors.add(:base, "Debes estar logueado para crear un post") unless user.present?
  end
end
