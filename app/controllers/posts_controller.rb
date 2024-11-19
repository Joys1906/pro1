class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  
  def create
    puts params.inspect # Esto imprimirá todos los parámetros que se están enviando
    @post = current_user.posts.new(permit_post)
    
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end


  def destroy
    @post = Post.find(params[:id])
    
    if @post.user == current_user
      @post.destroy
      flash[:success] = "El post ha sido eliminado"
      redirect_to posts_path
    else
      flash[:alert] = "No tienes permiso para eliminar este post"
      redirect_to posts_path
    end
  end
  


  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      flash[:alert] = "No tienes permiso para editar este post"
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
      if @post.update(permit_post)
        flash[:success] = "Post actualizado con éxito"
        redirect_to @post
      else
        render :edit
      end
    else
      flash[:alert] = "No tienes permiso para editar este post"
      redirect_to posts_path
    end
  end
  

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def permit_post
    params.require(:post).permit(:description, :image)
  end

  
end
