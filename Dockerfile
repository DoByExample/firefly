FROM ruby:2.3.0-onbuild

RUN apt-get update \
    && apt-get install -y sqlite3 \
    && rm -rf /var/lib/apt/lists/*
    
RUN gem install foreman
EXPOSE 2300
CMD ["./entrypoint.sh"]