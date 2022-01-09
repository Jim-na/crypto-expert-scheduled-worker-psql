FROM ruby:latest

WORKDIR /worker

COPY / .

RUN bundle install
ENV RACK_ENV=production
ENV DATABASE_URL=postgres://fcjcutshapcxoq:997c06fa3d2d5cd7943274048a863680f9f39e221556e8d9146028700d0d003f@ec2-18-235-86-66.compute-1.amazonaws.com:5432/d1inpu6f8fltsc
CMD rake worker