if (global.pausado)
{
    hspeed = 0;
    vspeed = 0;
    exit;
}

// Movimento em direção à base
var _dir = point_direction(x, y, obj_interacao.x, obj_interacao.y);
hspeed = lengthdir_x(1.4, _dir);
vspeed = lengthdir_y(1.4, _dir);

// Ao encostar causa dano e some
if (distance_to_object(obj_interacao) < 5)
{
    with (obj_interacao)
    {
        life -= 20;
    }
    instance_destroy();
}

depth = -bbox_bottom;

if (hp <= 0)
{
    var _sorteio = irandom(99);
    
    if (_sorteio < 75)
        instance_create_layer(x, y, "Instances", Obj_slime);
    else if (_sorteio < 95)
        instance_create_layer(x, y, "Instances", Obj_sucata);
    else
        instance_create_layer(x, y, "Instances", Obj_nucleo);
    
    instance_destroy();
}