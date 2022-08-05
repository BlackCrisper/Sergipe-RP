
function PegarIp(source)
    local Ip = "mtasa://"
    outputChatBox("Ip: "..Ip.."!", source, 255, 255, 214, true)
end

function PegarDc(source)
    local LinkDc = "https://discord.gg/9KyYx6Wqzt"
    outputChatBox("Discord: "..LinkDc.. "!", source, 255, 255, 252, true)
end
addCommandHandler("dc" PegarDc)

addCommandHandler("ip", PegarIp)