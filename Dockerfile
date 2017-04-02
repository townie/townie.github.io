FROM ruby:2.3

RUN gem install jekyll

EXPOSE 4000

COPY . /blog

EXPOSE 80 4000 8080

WORKDIR /blog

CMD [ "jekyll", "serve" ," --watch"]