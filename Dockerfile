FROM python:3.10

WORKDIR /app

# Copy the application files
COPY . /app/

# Install Python dependencies
RUN pip install -r requirements.txt

# Install ffmpeg using apt
RUN apt update && apt install -y ffmpeg

# CMD to run both gunicorn and bot.py
CMD ["sh", "-c", "gunicorn -b 0.0.0.0:8000 app:app & python3 bot.py"]
