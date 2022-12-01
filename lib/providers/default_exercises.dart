import '../models/exercise.dart';

// 'All',
// 'Back',
// 'Abs',
// 'Traps',
// 'Triceps',
// 'Forearms',
// 'Calves',
// 'Front Delts',
// 'Glutes',
// 'Chest',
// 'Biceps',
// 'Quads',
// 'Hamstrings',
// 'Side Delts',
// 'Rear Delts',

List<Exercise> DEFAULT_EXERCISES = [
  // Back
  Exercise(
    name: 'Barbell Bent Over Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Cambered Bar Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Barbell Row to Chest',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Underhand EZ Bar Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Smith Machine Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Chest Supported Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Machine Chest Supported Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'T Bar Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Incline Dumbbell Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Two Arm Dumbbell Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Single Arm Dumbbell Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Hammer Low Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Seal Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Inverted Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Seated Cable Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Normal Grip Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Wide Grip Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Parallel Grip Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Underhand Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Assisted Normal Grip Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
    assisted: true,
  ),
  Exercise(
    name: 'Assisted Wide Grip Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
    assisted: true,
  ),
  Exercise(
    name: 'Assisted Parallel Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
    assisted: true,
  ),
  Exercise(
    name: 'Assisted Underhand Pullup',
    barWeight: 45,
    bodyParts: ['Back'],
    assisted: true,
  ),
  Exercise(
    name: 'Normal Grip Pulldown',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Wide Grip Pulldown',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Parallel Pulldown',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Underhand Pulldown',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Narrow Grip Pulldown',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Hammer High Row',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Dumbbell Pullover',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Machine Pullover',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  Exercise(
    name: 'Straight Arm Pulldown',
    barWeight: 45,
    bodyParts: ['Back'],
  ),
  //Ab
  Exercise(
    name: 'Hanging Knee Raise',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'Hanging Straight Leg Raise',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'Machine Crunch',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'Modified Candlestick',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'Rope Crunch',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'Slant Board Situp',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'V-Up',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  Exercise(
    name: 'Reaching Situp',
    barWeight: 45,
    bodyParts: ['Abs'],
  ),
  //Traps
  Exercise(
    name: 'Barbell Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Barbell Bent Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Dumbbell Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Dumbbell Lean Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Cable Single Arm Side Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Cable Side Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Seated Dumbbell Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Cable Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Cable Bent Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  Exercise(
    name: 'Dumbbell Bent Shrug',
    barWeight: 45,
    bodyParts: ['Traps'],
  ),
  //Triceps
  Exercise(
    name: 'Barbell Triceps Overhead Extensions',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Assisted Dip',
    barWeight: 45,
    bodyParts: ['Triceps', 'Chest'],
    assisted: true,
  ),
  Exercise(
    name: 'Barbell Skullcrusher',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Cable Overhead Triceps Extensions',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Cable Single Arm Pushdown',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Dip',
    barWeight: 45,
    bodyParts: ['Triceps', 'Chest'],
  ),
  Exercise(
    name: 'Dumbbell Skullcrusher',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Ez Bar Overhead Triceps Extension',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Inverted Skullcrusher',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Machine Triceps Extension',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Machine Triceps Pushdown',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Rope Overhead Triceps Extension',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Rope Pushdown',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Seated EZ Bar Overhead Triceps Extension',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'JM Press',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Seated Barbell Overhead Triceps Extension',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  //Forearms
  Exercise(
    name: 'Dumbbell Standing Wrist Curls',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Barbell Standing Wrist Curls',
    barWeight: 45,
    bodyParts: ['Forearms'],
  ),
  Exercise(
    name: 'Dumbbell Bench Wrist Curls',
    barWeight: 45,
    bodyParts: ['Triceps'],
  ),
  Exercise(
    name: 'Cable Wrist Curls',
    barWeight: 45,
    bodyParts: ['Forearms'],
  ),
  //Calves
  Exercise(
    name: 'Calf Machine',
    barWeight: 45,
    bodyParts: ['Calves'],
  ),
  Exercise(
    name: 'Seated Calf Machine',
    barWeight: 45,
    bodyParts: ['Calves'],
  ),
  Exercise(
    name: 'Stair Calves',
    barWeight: 45,
    bodyParts: ['Calves'],
  ),
  Exercise(
    name: 'Single-Leg Stair Calves',
    barWeight: 45,
    bodyParts: ['Calves'],
  ),
  Exercise(
    name: 'Deficit Smith Machine Calves',
    barWeight: 45,
    bodyParts: ['Calves'],
  ),
  Exercise(
    name: 'Leg Press Calves',
    barWeight: 45,
    bodyParts: ['Calves'],
  ),
  //Front Delts
  Exercise(
    name: 'Barbell Front Raise',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Cable Underhand Front Raise',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Dumbbell Front Raise',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'EZ Bar Underhand Front Raise',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Machine Shoulder Press',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Seated Barbell Shoulder Press',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Smith Machine Seated Shoulder Press',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Standing Barbell Shoulder Press',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Standing Barbell Shoulder Press',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  Exercise(
    name: 'Standing Dumbbell Shoulder Press',
    barWeight: 45,
    bodyParts: ['Front Delts'],
  ),
  //Glutes
  Exercise(
    name: 'Barbell Hip Thrust',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Barbell Walking Lunge',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Cable Pull-Through',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Deadlift',
    barWeight: 45,
    bodyParts: ['Glutes', 'Back'],
  ),
  Exercise(
    name: 'Deficit Deadlift',
    barWeight: 45,
    bodyParts: ['Glutes', 'Hamstrings', 'Back'],
  ),
  Exercise(
    name: 'Dumbbell Walking Lunge',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Machine Glute Kickback',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Machine Hip Thrust',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Reverse Lunge',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Single Leg Hip Thrust',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Split Squat',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Sumo Deadlift',
    barWeight: 45,
    bodyParts: ['Glutes', 'Back'],
  ),
  Exercise(
    name: 'Sumo Deficit Deadlift',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Sumo Squat',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Trap Bar Deadlift',
    barWeight: 45,
    bodyParts: ['Glutes', 'Back'],
  ),
  Exercise(
    name: 'Dumbbell Reverse Lunge',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Dumbbell Split Squat',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Dumbbell Single Leg Hip Thrust',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  Exercise(
    name: 'Wide Stance Belt Squat',
    barWeight: 45,
    bodyParts: ['Glutes'],
  ),
  //Chest
  Exercise(
    name: 'Cable Flye',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Cable Bent Flye',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Cable Underhand Flye',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Cambered Bar Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Deficit Pushup',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Flat Dumbbell Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Deficit Pushup',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Flat Dumbbell Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Flat Dumbbell Flye',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Incline Machine Chest Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Incline Barbell Press Medium Grip',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Incline Barbell Press Wide Grip',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Incline Barbell Press Narrow Grip',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Low Incline Dumbbell Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Machine Chest Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Machine Flye',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Medium Grip Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Narrow Pushup',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Narrow Grip Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Pec Deck Flye',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Pushup',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Smith Machine Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Smith Machine Incline Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Smith Machine Narrow Grip Incline Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Smith Machine Narrow Grip Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Smith Machine Wide Grip Incline Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Smith Machine Wide Grip Incline Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  Exercise(
    name: 'Wide Grip Bench Press',
    barWeight: 45,
    bodyParts: ['Chest'],
  ),
  //Quads
  Exercise(
    name: 'Feet Forward Smith Squat',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Front Squat Cross Grip',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Front Squat',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Hack Squat',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'High Bar Squat',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Leg Extension',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Leg Press',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Narrow Stance Squat',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  Exercise(
    name: 'Belt Squat',
    barWeight: 45,
    bodyParts: ['Quads'],
  ),
  //Hamstrings
  Exercise(
    name: 'Back Hyperextensions',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Dumbbell Stiff Legged Deadlift',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Glute Ham Raise',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Barbell Good Morning',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Safety Bar Good Morning',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Machine Good Morning',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Lying Leg Curl',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Seated Leg Curl',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Single Leg Curl',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  Exercise(
    name: 'Stiff Legged Dead Lift',
    barWeight: 45,
    bodyParts: ['Hamstrings'],
  ),
  //Side Delts
  Exercise(
    name: 'Barbell Upright Row',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Cable Cross Body Lateral Raise',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Cable Face Pull',
    barWeight: 45,
    bodyParts: ['Side Delts', 'Rear Delts'],
  ),
  Exercise(
    name: 'Dumbbell Upright Row',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Lateral Raise',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Leaning Cable Lateral Raise',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Machine Lateral Raise',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Smith Machine Upright Row',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Thumbs Down Lateral Raise',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  Exercise(
    name: 'Top Hold Lateral Raise',
    barWeight: 45,
    bodyParts: ['Side Delts'],
  ),
  //Rear Delts
  Exercise(
    name: 'Bent Lateral Raise',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Cable Cross Body Bent Lateral Raise',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Cable Single Arm Read Delt Raise',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Dumbbell Facepull',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Incline Dumbbell Facepull',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Incline Dumbbell Lateral Raise',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Machine Reverse Flye',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
  Exercise(
    name: 'Barbell Facepull',
    barWeight: 45,
    bodyParts: ['Rear Delts'],
  ),
];
