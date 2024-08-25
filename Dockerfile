FROM manimcommunity/manim:latest

WORKDIR /app

COPY requirements.txt .

USER root

RUN apt-get update && apt-get upgrade -y
RUN pip install -U manim
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get install texlive-full -y
RUN tlmgr update --self
RUN tlmgr install luatex85
# COPY ./fonts/haranoaji /usr/share/fonts/opentype/haranoaji
# COPY ./fonts/haranoaji-extra /usr/share/fonts/opentype/haranoaji-extra
RUN fc-cache -fv

EXPOSE 10000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "10000", "--reload"]