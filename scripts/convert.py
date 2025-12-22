import sys
import pymeshlab as ml

print(sys.argv)
input_fn = sys.argv[1]
output_fn = input_fn[:-4] + '.off'

ms = ml.MeshSet()
ms.load_new_mesh(input_fn)

# print(ms.print_filter_script())

# # Common safe repairs
# ms.apply_filter('remove_duplicate_vertices')
# ms.apply_filter('remove_zero_area_faces')
# ms.apply_filter('remove_unreferenced_vertices')
# ms.apply_filter('merge_close_vertices', threshold=0.0001)
# ms.apply_filter('repair_non_manifold_edges')

# Optional: fill holes
# ms.apply_filter('close_holes', maxholesize=100)

ms.save_current_mesh(output_fn)