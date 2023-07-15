key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_attack = keyboard_check_pressed(ord("K"));



var move = key_right - key_left;

hsp = move * kecepatan;

vsp = vsp + grv;

if(place_meeting(x,y+1,obj_Tanah)) && (key_jump)
{
	vsp = -5;
}
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_Tanah))
{
	while(!place_meeting(x+sign(hsp),y,obj_Tanah))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Movement
if (place_meeting(x,y+vsp,obj_Tanah))
{
	while(!place_meeting(x,y+sign(vsp),obj_Tanah))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animasi Flip
if (keyboard_check(ord("D")))
{
    flip_status = 1; // Menghadap ke kanan
}
else if (keyboard_check(ord("A")))
{
    flip_status = 0; // Menghadap ke kiri
}

// Perbarui arah flip dan kecepatan animasi
image_xscale = flip_status * 2 - 1; // Mengubah image_xscale antara 1 dan -1
image_speed = animation_speed;

//Animasi
if(!place_meeting(x,y+1,obj_Tanah))
{
	sprite_index = spr_Loncat;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 1; else image_index = 0;
	
}
else
{
	image_speed = 0.1;
	if(hsp == 0)
	{
		sprite_index = spr_Diam;
	}
	else
	{
		sprite_index = spr_Jalan;
	}
}
if (keyboard_check(ord("K"))) {
    sprite_index = spr_Menyerang; // Ganti dengan sprite pemain saat menyerang
    image_speed = 5; // Kecepatan animasi serangan
    image_index = 1; // Mulai dari frame pertama
    attacking = true; // Tandai bahwa pemain sedang menyerang
}
if (sprite_index == spr_Diam) {
    sprite_index = spr_Diam; // Ganti dengan sprite pemain saat idle
    image_speed = 0; // Hentikan animasi
    attacking = false; // Tandai bahwa serangan selesai
}