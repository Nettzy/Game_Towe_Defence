estado = "parado";

vel  = 2; 
velh = 0;
velv = 0;

direita  = 0;
esquerda = 0;
cima     = 0;
baixo    = 0;
controles = function()
{
direita		= keyboard_check(vk_right);
esquerda	= keyboard_check(vk_left);
cima		= keyboard_check(vk_up);
baixo		= keyboard_check(vk_down);

velh = (direita - esquerda)* vel;
velv = (baixo - cima)* vel;
}