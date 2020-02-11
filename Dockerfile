FROM swipl:stable

WORKDIR /app

ADD . .

ENTRYPOINT [ "swipl" ]

CMD [ "/app/kokoro.pl" ]
