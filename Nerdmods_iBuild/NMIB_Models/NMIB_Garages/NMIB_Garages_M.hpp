class Garage_Type1_Solid : Default
{
	skeletonName = "iBuild_DoubleDoor_Bones";
	
	class Animations
	{
		class Door_1A : Rotation
		{
			type = "rotation";
			source = "user";
			sourceAddress = "clamp";
			memory = 1;
			minValue = 0;
			maxValue = 1;
			angle0 = "rad 0";
			angle1 = "rad -90";
		
			selection = "Door_1A";
			axis = "Door_1A_Axis";
		};
		class Door_1B : Rotation
		{
			type = "rotation";
			source = "user";
			sourceAddress = "clamp";
			memory = 1;
			minValue = 0;
			maxValue = 1;
			angle0 = "rad 0";
			angle1 = "rad 180";
		
			selection = "Door_1B";
			axis = "Door_1B_Axis";
		};
		class Door_2A : Rotation
		{
			type = "rotation";
			source = "user";
			sourceAddress = "clamp";
			memory = 1;
			minValue = 0;
			maxValue = 1;
			angle0 = "rad 0";
			angle1 = "rad 90";
		
			selection = "Door_2A";
			axis = "Door_2A_Axis";
		};
		class Door_2B : Rotation
		{
			type = "rotation";
			source = "user";
			sourceAddress = "clamp";
			memory = 1;
			minValue = 0;
			maxValue = 1;
			angle0 = "rad 0";
			angle1 = "rad -180";
		
			selection = "Door_2B";
			axis = "Door_2B_Axis";
		};
	};
};

class Garage_Type1_Ghost : Default {};