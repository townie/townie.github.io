FROM ruby:2.3

# Install jekyll
RUN gem install jekyll

# Copy code into container
COPY . /blog
WORKDIR /blog

EXPOSE 80 4000 8080
# ENV PORT 
# Start serving blog
CMD [ "jekyll", "serve" ," --watch"]
# CMD jekyll serve -P $PORT
