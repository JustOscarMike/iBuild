class Door_Type1_Solid : Default
{
	skeletonName = "iBuild_SingleDoor_Bones";
	
	class Animations
	{
		class door : Rotation
		{
			type = "rotation";
			source = "user";
			sourceAddress = "clamp";
			memory = 1;
			minValue = 0;
			maxValue = 1;
			angle0 = "rad 0";
			angle1 = "rad -90";
		
			selection = "door";
			axis = "door_axis";
		};
	};
};

class Door_Type1_Ghost : Default {};