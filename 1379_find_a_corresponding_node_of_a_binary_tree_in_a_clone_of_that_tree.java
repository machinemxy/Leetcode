// https://leetcode.com/problems/find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

class Solution {
    public final TreeNode getTargetCopy(final TreeNode original, final TreeNode cloned, final TreeNode target) {
        if(original == target) {
            return cloned;
        } else {
            if(original.left != null) {
                TreeNode leftResult = getTargetCopy(original.left, cloned.left, target);
                if(leftResult != null) {
                    return leftResult;
                }
            }

            if(original.right != null) {
                TreeNode rightResult = getTargetCopy(original.right, cloned.right, target);
                if(rightResult != null) {
                    return rightResult;
                }
            }

            return null;
        }
    }
}
