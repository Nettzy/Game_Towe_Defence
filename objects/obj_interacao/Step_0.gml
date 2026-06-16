mostrar_botao = false;

if (place_meeting(x, y, obj_player))
{
    mostrar_botao = true;
    
    if (keyboard_check_pressed(ord("E")))
    {
        // Reposiciona o player ANTES de trocar de room
        with (obj_player)
        {
            x = 290;
            y = 390;
        }
        
        room_goto(Room2);
    }
}