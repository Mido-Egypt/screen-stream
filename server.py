from fastapi import FastAPI, WebSocket
from fastapi.responses import HTMLResponse

app = FastAPI()
owners = {}

@app.websocket("/ws/owner/{sid}")
async def owner(ws: WebSocket, sid: str):
    await ws.accept()
    owners[sid] = ws
    while True:
        await ws.receive_text()

@app.websocket("/ws/stream/{sid}")
async def stream(ws: WebSocket, sid: str):
    await ws.accept()
    while True:
        data = await ws.receive_text()
        if sid in owners:
            await owners[sid].send_text(data)

@app.get("/owner/{sid}")
async def owner_page(sid: str):
    return HTMLResponse(open("owner.html").read().replace("SID", sid))

@app.get("/stream/{sid}")
async def stream_page(sid: str):
    return HTMLResponse(open("stream.html").read().replace("SID", sid))