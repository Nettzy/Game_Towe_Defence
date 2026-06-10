
controles = function()
{
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo  = keyboard_check(ord("S"));

velh = (direita - esquerda) * vel;
velv = (baixo - cima) * vel;
}






controles();

move_and_collide(velh, velv, all);

