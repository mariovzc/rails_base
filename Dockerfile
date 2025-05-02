FROM ruby:3.3.0-slim

# Instalar dependencias del sistema necesarias para la compilación de sqlite3
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    nodejs \
    yarn \
    git \
    sqlite3 \
    bash \
    libffi-dev

# Instalar bundler y rails
RUN gem install bundler -v 2.5.6 && \
    gem install rails -v 7.1.3

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos Gemfile y Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Ejecutar bundle install
RUN bundle install

# Exponer el puerto 3000 para Rails
EXPOSE 3000

# Comando por defecto
CMD ["bash"]
