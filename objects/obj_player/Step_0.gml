depth = -bbox_bottom;

controles = function()
{
    direita = keyboard_check(ord("D"));
    esquerda = keyboard_check(ord("A"));
    cima = keyboard_check(ord("W"));
    baixo  = keyboard_check(ord("S"));

    show_debug_message(arma);

    if(cima xor baixo or esquerda xor direita)
    {
        move_dir = point_direction(0,0, (direita - esquerda),(baixo - cima));
        vel = max_vel;
    }
    else
    {
        vel = lerp(vel,0,0.1);
    }

    velh = lengthdir_x(vel, move_dir);
    velv = lengthdir_y(vel, move_dir);
}

#region 
if distance_to_object(obj_pai_npc) <= 10
{
    if keyboard_check_pressed(ord("E")) and global.dialogo == false
    {
        var _npc = instance_nearest(x, y, obj_pai_npc);

        if object_is_ancestor(_npc.object_index, obj_lojista) or _npc.object_index == obj_lojista
        {
            // Abre o menu de opções do lojista
            _npc.menu_ativo = true;
            _npc.menu_opcao = 0;
        }
        else
        {
            var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
            _dialogo.npc_nome = _npc.nome;
        }
    }
}
#endregion

usa_arma();
controles();
olhar_mouse();
move_and_collide(velh, velv, all);
