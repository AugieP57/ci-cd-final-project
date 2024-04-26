FROM python:3.9-slim

# Establish a working folder
WORKDIR /app

# Copy source files last because they change the most
COPY service ./service

# Become non-root user
RUN useradd -m -r service && \
    chown -R service:service /app
USER service

# Run the service on port 8000
ENV PORT 8000
EXPOSE $PORT
CMD ["gunicorn", "service:app", "--bind", "0.0.0.0:8000"]
