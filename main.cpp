#include <meshoptimizer.h>
#include <ufbx.h>
#include <stdlib.h>
#include <cstdio>

#include "usd_data.h"

/// @brief This data struct contains everything we need to dump inside the usd file
/// Mesh, animation, bones, etc.
/// Different importer will fill this data
struct UsdData {

};

int main() {
    ufbx_load_opts opts = { 0 }; // Optional, pass NULL for defaults
    ufbx_error error; // Optional, pass NULL if you don't care about errors
    ufbx_scene *scene = ufbx_load_file("data/max_geometry_transform_instances_6100_ascii.fbx", &opts, &error);
    if (!scene) {
        fprintf(stderr, "Failed to load: %s\n", error.description.data);
        exit(1);
    }

    

    // Use and inspect `scene`, it's just plain data!

    // Let's just list all objects within the scene for example:
    for (size_t i = 0; i < scene->nodes.count; i++) {
        ufbx_node *node = scene->nodes.data[i];
        if (node->is_root) {
            continue;
        }
        
        auto attribs = node->all_attribs;
        for (size_t j = 0; j < attribs.count; j++) {
            auto attrib = attribs[j];
            if (attrib->type == UFBX_ELEMENT_BONE)
                ufbx_as_bone(attrib);
        }
        

        printf("Object: %s\n", node->name.data);
        if (node->mesh) {
            printf("-> mesh with %zu faces\n", node->mesh->faces.count);
        }
    }

    ufbx_free_scene(scene);


}